# SSH Push To Github

![SSH Diagram](<../README_images/SSH Push To Github Screenshot.jpg>)

## 1 - Generate Key Pair
1. cd .ssh
2. ssh-keygen -t rsa -b 4096 -C "fergus.thompson@hotmail.co.uk"
3. Enter name, enter for no password and once more to confirm

## 2 - Register Public Key on GitHub
1. Log in to GitHub, go to our account settings, SSH and GPG keys and add SSH key. Provide same name as key, make sure it's Authentication Key.
2. On terminal use the cat command on the .pub key file and copy contents from ssh-rsa to end of email.
3. Paste into Key text box and click Add SSH key, confirm with password and hit enter.
![Add New SSH GitHub](<../README_images/Add New SSH Screenshot.jpg>)

## 3 - Add Private Key to SSH Register
1. "eval `ssh-agent -s`" - This command starts the SSH agent, a program that manages SSH keys and provides secure access to remote systems.
2. "ssh-add fergus-github-key" - This command adds an SSH private key to the SSH agent for authentication purposes.
3. "ssh -T git@github.com" - This command tests your SSH authentication by attempting to connect to the GitHub server (github.com) as the user git.

## 4 - Create Test Repo
1.  Create test repo

## 5 - Push Changes to Test Repo
1. Move into directory where you want repo
2. mkdir test-ssh
3. cd test-ssh
4. echo "# push using ssh successful" >> README.md
5. git init
6. git add .
7. git commit -m "Added readme"
8. git branch -M main  
9. git remote add origin git@github.com:FThompsonSG/test-ssh.git
10. git push -u origin main