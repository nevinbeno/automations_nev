# Let's automate some daily tasks
## For the attention of readers
- We use scripting for the automations. 
- Instead of of running scripts, we turn them into linux commands, so that, we could run it from anywhere. 
### Converting bash scripts into linux commands (an example)
> Steps 1 and 2 to be done only once. The rest to be done per file.

1. We create a dedicated folder for these commands:
    ```bash
    mkdir -p ~/.local/bin
    ```
2. Add this location to the `"$PATH"` variable:
    > In linux, every command corresponds to an executable file. Some are compiled binaries, while others are scripts interpreted by programs such as Bash or Python. For instance, the location of `ls` command could be determined using the command `command -v ls`. 
    Every command is some binary executable (use the `file` command to verify). The location of these commands are pre-defined, and those locations are known to the OS. OS was already instructed to check those locations for commands to execute.  
    But, if we create our own commands (files) inside this newly created location, then, the OS should be informed to consider that location as well. This is what we do by adding the location to "$PATH"
    
    ```bash
    nano ~/.bashrc # opens the bashrc file
    export PATH="$HOME/.local/bin:$PATH" # paste this line anywhere
    ```

    To exit bashrc, 
    ```
    - Ctrl + O 
    - Enter Key
    - Ctrl + X
    ```

    Then source it:
    ```bash
    source ~/.bashrc
    ```

    Verify using:
    ```bash
    echo "$PATH"
    ```

    Output:
    ```
    /home/nevin/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin
    ```

   Should show the new location (.local/bin)
3. Create file. 
4. Rename the file if the extension is also included. 
    ```bash
    mv auto-update.sh auto-update
    ```
5. Make it executable:
    ```bash
    chmod +x auto-update
    ls -l auto-update # to verify, should show 'x' also
    ```
6. Run it from anywhere: 
    ```bash
    auto-update
    ```