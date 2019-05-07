java_dist=""
java_dir=""

function help {
    echo ""
    echo "Usage: "
    echo "install-java.sh -f <java_dist> [-p] <java_dir>"
    echo ""
    echo "-f: The jdk tar.gz file"
    echo "-p: Java installation directory"
    echo ""
}

confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure?} [y/N] " response
    case $response in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

# Make sure the script is running as root.
if [ "$UID" -ne "0" ]; then
    echo "You must be root to run $0. Try following"; echo "sudo $0";
    exit 9
fi


while getopts "f:p:" opts
do
  case $opts in
    f)
        java_dist=${OPTARG}
        ;;
    p)
        java_dir=${OPTARG}
        ;;
    \?)
        help
        exit 1
        ;;
  esac
done

if [[ ! -f $java_dist ]]; then
    echo "Please specify the java distribution file (tar.gz)"
    help
    exit 1
fi

#Check whether unzip command exsits
if ! command -v unzip >/dev/null 2>&1; then
    echo "Please install unzip (apt -y install unzip)"
    exit 1
fi

#If no directory was provided, we need to create the default one
if [[ -z $java_dir ]]; then
    java_dir="/usr/lib/jvm"
    mkdir -p $java_dir
fi

#Validate java directory
if [[ ! -d $java_dir ]]; then
    echo "Please specify a valid java installation directory"
    exit 1
fi

# Validate Java Distribution
java_dist_filename=$(basename $java_dist)

java_78_dist_file_regex="jdk-([78])u([0-9]{1,3})-linux-(i586|x64)\.tar\.gz"
java_9up_dist_file_regex="jdk-([91][0-9]?\.?[0-9]*\.?[0-9]*)_linux-x(32|64)_bin\.tar\.gz"

# JDK Directory with version
jdk_dir=""
# JDK Major Version
jdk_major_version=""

if [[ $java_dist_filename =~ $java_78_dist_file_regex ]]; then
    jdk_dir=$(echo $java_dist_filename | sed -nE "s/$java_78_dist_file_regex/jdk1.\1.0_\2/p")
    jdk_major_version=$(echo $jdk_dir | sed -nE 's/jdk1\.([0-9]*).*/\1/p')
elif [[ $java_dist_filename =~ $java_9up_dist_file_regex ]]; then
    jdk_dir=$(echo $java_dist_filename | sed -nE "s/$java_9up_dist_file_regex/jdk-\1/p")
    jdk_major_version=$(echo $jdk_dir | sed -nE 's/jdk-([0-9]*).*/\1/p')
else
    echo "Please specify a valid java distribution"
    exit 1
fi

extracted_dirname=$java_dir"/"$jdk_dir

# Extract Java Distribution

if [[ ! -d $extracted_dirname ]]; then
    echo "Extracting $java_dist to $java_dir"
    tar -xof $java_dist -C $java_dir
    echo "JDK is extracted to $extracted_dirname"
else 
    echo "JDK is already extracted to $extracted_dirname"
fi


if [[ ! -f $extracted_dirname"/bin/java" ]]; then
    echo "Couldn't check the extracted directory. Please check the installation script"
    exit 1
fi

# Install Demos

if [[ $java_dist_filename =~ $java_78_dist_file_regex ]]; then
    # Demos are only available for Java 7 and 8
    demos_dist=$(dirname $java_dist)"/"$(echo $java_dist_filename | sed 's/\.tar\.gz/-demos\0/')
fi

if [[ -f $demos_dist && ! -d $extracted_dirname/demo ]]; then
    # No demo directory
    if (confirm "Extract demos?"); then
        echo "Extracting $demos_dist to $java_dir"
        tar -xf $demos_dist -C $java_dir
    fi
fi

# Install Unlimited JCE Policy

unlimited_jce_policy_dist=""

if [[ "$java_dist_filename" =~ ^jdk-7.* ]]; then
    unlimited_jce_policy_dist="$(dirname $java_dist)/UnlimitedJCEPolicyJDK7.zip"
elif [[ "$java_dist_filename" =~ ^jdk-8.*  ]]; then
    unlimited_jce_policy_dist="$(dirname $java_dist)/jce_policy-8.zip"
elif [[ "$java_dist_filename" =~ ^jdk-9.*  ]]; then
    echo "Java 9 default JCE policy files already allow for \"unlimited\" cryptographic strengths."
fi

if [[ -f $unlimited_jce_policy_dist ]]; then
    if (confirm "Install Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files?"); then
        echo "Extracting policy jars in $unlimited_jce_policy_dist to $extracted_dirname/jre/lib/security"
        unzip -j -o $unlimited_jce_policy_dist *.jar -d $extracted_dirname/jre/lib/security
    fi
fi

# Run update-alternatives commands

commands=( "jar" "java" "javac" "javadoc" "javah" "javap" "javaws" "jcmd" "jconsole" "jarsigner" "jhat" "jinfo" "jmap" "jmc" "jps" "jstack" "jstat" "jstatd" "jvisualvm" "keytool" "policytool" "wsgen" "wsimport" )

if (confirm "Run update-alternatives commands?"); then
    echo "Running update-alternatives --install and --config for ${commands[@]} mozilla-javaplugin.so"

    for i in "${commands[@]}"
    do
        command_path=$extracted_dirname/bin/$i
        if [[ -f $command_path ]]; then
            update-alternatives --install "/usr/bin/$i" "$i" "$command_path" 10000
            update-alternatives --set "$i" "$command_path"
        fi
    done

    lib_path=$extracted_dirname/jre/lib/amd64/libnpjp2.so
    if [[ -d "/usr/lib/mozilla/plugins/" && -d $lib_path ]]; then
        update-alternatives --install "/usr/lib/mozilla/plugins/libjavaplugin.so" "mozilla-javaplugin.so" "$lib_path" 10000
        update-alternatives --set "mozilla-javaplugin.so" "$lib_path"
    fi
fi

# Create system preferences directory
java_system_prefs_dir="/etc/.java/.systemPrefs"
if [[ ! -d $java_system_prefs_dir ]]; then
    if (confirm "Create Java System Prefs Directory and change ownership to $SUDO_USER:$SUDO_USER?"); then
        echo "Creating $java_system_prefs_dir"
        mkdir -p $java_system_prefs_dir
        chown -R $SUDO_USER:$SUDO_USER $java_system_prefs_dir
    fi
fi

if (confirm "Do you want to set JAVA_HOME environment variable?"); then
    if grep -q "export JAVA_HOME=.*" $HOME/.bashrc; then
        sed -i "s|export JAVA_HOME=.*|export JAVA_HOME=$extracted_dirname|" $HOME/.bashrc
    else
        echo "export JAVA_HOME=$extracted_dirname" >> $HOME/.bashrc
    fi
    source $HOME/.bashrc
fi

applications_dir="$HOME/.local/share/applications"

create_jmc_shortcut() {
shortcut_file="$applications_dir/jmc_$jdk_major_version.desktop"
cat << _EOF_ > $shortcut_file
[Desktop Entry]
Name=Java $jdk_major_version: JMC
Comment=Oracle Java Mission Control for Java $jdk_major_version
Type=Application
Exec=$extracted_dirname/bin/jmc
Icon=$extracted_dirname/lib/missioncontrol/icon.xpm
Terminal=false
_EOF_
chmod +x $shortcut_file
}

if [[ -d $applications_dir ]]; then
    if (confirm "Do you want to create a desktop shortcut to JMC?"); then
        create_jmc_shortcut
    fi
fi
