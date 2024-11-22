## Scripts

* **Update**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/update.sh)"
* **Core**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/tools/core.sh)"
* **ZSH**: sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
* **Go**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/tools/languages/golang.sh)"
* **Python**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/tools/languages/python.sh)"
* **Java**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/tools/languages/java.sh)"
* **NodeJS**: sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/tools/languages/nodejs.sh)"
* **IDE**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/tools/ide.sh)"
* **Art**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/tools/extra/art.sh)"
* **Stuffs**: sh -c "$(curl -fsSL https://raw.githubusercontent.com/JefersonOC/bash/master/tools/extra/stuffs.sh)"

## Update All Python Packages
```
pip3 list -o | cut -f1 -d' ' | tr " " "\n" | awk '{if(NR>=3)print}' | cut -d' ' -f1 | xargs -n1 pip3 install -U --break-system-packages
```
## Ledger Live
```
wget -q -O - https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/add_udev_rules.sh | sudo bash
```
## Docker without root
```
$ sudo addgroup --system docker
$ sudo adduser $USER docker
$ newgrp docker
$ sudo apt install docker.io
```
## Metatrader 5
```
wget https://download.mql5.com/cdn/web/metaquotes.software.corp/mt5/mt5ubuntu.sh ; chmod +x mt5ubuntu.sh ; ./mt5ubuntu.sh
```
