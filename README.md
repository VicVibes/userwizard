#userwizard 
A bash script that helps you quickly create a new Linux user, assign them to a group, generate a secure password, set folder permissions, and log everything automatically. Built for sysadmins and IT guys who like things done clean and fast.
- Asks you for a username
- Shows a list of user groups to pick from (Developer, Marketing, Admin)
- Adds the user to the selected group
- Generates a random temporary password
- Forces the user to change password on first login
- Sets their home folder permission to `chmod 700`
- Logs everything into a text file for reference


## Requirements

- Linux machine with `bash` and `sudo` access  
- `openssl` (for password generation)  
- Basic terminal knowledge  
- A logs folder on your desktop (`/home/yourname/Desktop/logs`) or edit the script path

---

## How to use

1. Clone or download this repo
```bash
git clone https://github.com/VicVibes/userwizard.git
cd userwizard
chmod +x userwizard.sh
