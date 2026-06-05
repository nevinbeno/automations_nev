# Auto-Update
![Bash](https://img.shields.io/badge/Bash-Scripting-4EAA25?logo=gnubash)
![Ubuntu](https://img.shields.io/badge/Tested-Ubuntu_24.04_LTS-E95420?logo=ubuntu)

## Aim
- To automate the update-upgrade-workflow in Linux machines.
- Here, we turn
```bash
sudo apt update
sudo apt upgrade
sudo apt autoremove
```
- Into one shell script: 
```bash
auto-update
```
## Output 
<div align="center">
    <img src="img/v1.png" hight=65></img>
</div>

## Compatibility
This script is intended for Ubuntu and other Debian-based distributions that use the `apt` package manager.

## Setup
1. Go to your "own-command" folder:
    ```bash
    cd ~/.local/bin
    ```

    Haven't created ? Just check [here](../README.md#converting-bash-scripts-into-linux-commands-an-example)
2. Create file (clone / copy paste)
3. Rename the file if the extension is also included. 
    ```bash
    mv auto-update.sh auto-update
    ```

    This helps us to attain the 'Linux command' feel. 
4. Make it executable:
    ```bash
    chmod +x auto-update
    ls -l auto-update # to verify, should show 'x' also
    ```
5. Run it from anywhere: 
    ```bash
    auto-update
    ```