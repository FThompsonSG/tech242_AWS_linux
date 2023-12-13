# Linux

## Bash (Bourne Again Shell) An Interface that Runs Commands<br>Commands
- uname -a = displays all system information
- uname --help = displays a help message and exit
- pwd = prints working directory
- cd <directoryname> = Navigate to specified directory
- clear = clears the terminal
- whoami = gets the active username
- curl <fileurl> = download a file from source url
- cp <filename> <newfilename> = copy a file
- rm <filename> = remove a file
- mv <filename> <renamedfile> OR <destinationfolder> = rename or move file
- mkdir <newdirectoryname> = make new directory
- touch <filename> = make an empty file
- cat <filename> = check file contents
- nano <filename> = modify file contents (ctrl s to save and ctry x to exit) or creates file if it doesn't exist
- head or tail -number <filename> = prints specified number of lines from head or tail
- grep 'word' <filename> or <directory> = search for text in files
- chmod +<permissiontype> <filename> = changes file permissions
- chown = granting ownership of files or folders
- sudo = command to escalate privileges
- whatis = find out what a command is used for
- sudo apt update -y = downloads updates and is a good way to check internet connection
- sudo apt upgrade -y = installs the updates
- sudo apt install nginx -y = installs nginx
- sudo systemctl status nginx = check manager processes
- sudo systemctl restart nginx = restarts nginx which we do if we have changed the configurations and want to apply
- sudo systemctl enable nginx = starts process/service automatically at boot
- ls -l = permissions
- export = assign environment variable

~ is a tilda and means home directory
/ means root and root is higher than home directory
Absolute Path starts at the root directory
Shell script files end in .sh
Shell scripts start with #!/bin/bash which is the path pointing to the interpreter
Test commands manually before adding to the script
To run script, provide path to run script but may need to change permission of x first
Include echoes in script
If a script is idempotent it can be run as many times as we like
Environment variable can be used to store sensitive data