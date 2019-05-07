java_dist_dir=""

function help {
    echo ""
    echo "Usage: "
    echo "uninstall-java.sh -p <java_dist_dir>"
    echo ""
    echo "-p: Java distribution directory"
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


while getopts "p:" opts
do
  case $opts in
    p)
        java_dist_dir=${OPTARG}
        ;;
    \?)
        help
        exit 1
        ;;
  esac
done

if [[ ! -f $java_dist_dir/bin/java ]]; then
    echo "Please specify a valid java distribution directory"
    help
    exit 1
fi

# Run update-alternatives commands

commands=( "jar" "java" "javac" "javadoc" "javah" "javap" "javaws" "jcmd" "jconsole" "jarsigner" "jhat" "jinfo" "jmap" "jmc" "jps" "jstack" "jstat" "jstatd" "jvisualvm" "keytool" "policytool" "wsgen" "wsimport" )

if (confirm "Run update-alternatives commands?"); then
    echo "Running update-alternatives --remove for ${commands[@]} mozilla-javaplugin.so"

    for i in "${commands[@]}"
    do
        update-alternatives --remove "$i" "$java_dist_dir/bin/$i"
    done

    if [[ -d "/usr/lib/mozilla/plugins/" ]]; then
        update-alternatives --remove "mozilla-javaplugin.so" "$java_dist_dir/jre/lib/amd64/libnpjp2.so"
    fi
fi

if (confirm "Remove directory '$java_dist_dir'?"); then
    rm -rf $java_dist_dir
fi

jdk_major_version=""

if [[ $java_dist_dir =~ .*jdk1\.([0-9]*).* ]]; then
    jdk_major_version=$(echo $java_dist_dir | sed -nE 's/.*jdk1\.([0-9]*).*/\1/p')
elif [[ $java_dist_dir =~ .*jdk-([0-9]*).* ]]; then
    jdk_major_version=$(echo $java_dist_dir | sed -nE 's/.*jdk-([0-9]*).*/\1/p')
fi

applications_dir="$HOME/.local/share/applications"
jmc_shortcut_file="$applications_dir/jmc_$jdk_major_version.desktop"

if [ -f $jmc_shortcut_file ] && (confirm "Remove JMC shortcut?"); then
    rm $jmc_shortcut_file
fi
