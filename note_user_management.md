#add #delete #modifiy #ammend#
User | Group | File | Folder | Password | Privillage | SUDO

Add User
-useradd (username, directory, User ID (UID), Group ID (GID),Without a Home Directory

Delete User
-userdel
-rmuser

Modify User
-usermod

User Passsword
-passwd
-chpasswd

Add User to group
usermod -aG <groupname> <username>
gpasswd -a <username> <groupname> 

Remove user from group

gpasswd -d <username> <groupname> #remove sudo rights with gpasswd

deluser <username> <groupname>

vi /etc/group      #

groups <username>      # Verifying 

#Utilities

      lslogins      #display information about available users in the system
      who @ w
      chage      #change the user password expiry information
      last      #listing of users who logged into the system
      gpasswd      #administrates /etc/group and /etc/gshadow files

#useradd
      
check User

      useradd -D #Displays the current default settings for new user accounts.
      getent passwd #will display all entries in the password database (/etc/passwd).Get entries
      getent shadow
      getent group #will display all entries in the group database (/etc/group).
      getent hosts example.com will display the IP address(es) associated with the hostname "example.com" from the hosts database (/etc/hosts or DNS).
      getent services ssh will display the port(s) associated with the SSH service from the services database (/etc/services).

useradd -m -d /opt/jane jane
useradd -a
usermod -aG wheel jorn

useradd - create a new user or update default new user information

Options:

      --badname                 do not check for bad names
        -b, --base-dir BASE_DIR       base directory for the home directory of the
                                new account
      --btrfs-subvolume-home    use BTRFS subvolume for home directory
        -c, --comment COMMENT         GECOS field of the new account
        -d, --home-dir HOME_DIR       home directory of the new account
        -D, --defaults                print or change default useradd configuration
        -e, --expiredate EXPIRE_DATE  expiration date of the new account
        -f, --inactive INACTIVE       password inactivity period of the new account
        -g, --gid GROUP               name or ID of the primary group of the new
                                account
        -G, --groups GROUPS           list of supplementary groups of the new
                                account
        -h, --help                    display this help message and exit
        -k, --skel SKEL_DIR           use this alternative skeleton directory
        -K, --key KEY=VALUE           override /etc/login.defs defaults
        -l, --no-log-init             do not add the user to the lastlog and
                                faillog databases
        -m, --create-home             create the user's home directory
        -M, --no-create-home          do not create the user's home directory
        -N, --no-user-group           do not create a group with the same name as
                                the user
        -o, --non-unique              allow to create users with duplicate
                                (non-unique) UID
        -p, --password PASSWORD       encrypted password of the new account
        -r, --system                  create a system account
        -R, --root CHROOT_DIR         directory to chroot into
        -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
        -s, --shell SHELL             login shell of the new account
        -u, --uid UID                 user ID of the new account
        -U, --user-group              create a group with the same name as the user
        -Z, --selinux-user SEUSER     use a specific SEUSER for the SELinux user mapping


EXAMPLES
   
    1. Create a new user with default settings:
        useradd john
    2. Create a new user with a specific home directory and login shell:
        useradd -d /home/jane -s /bin/zsh jane
    3. Create a new user with a comment and specify the primary group:
        useradd -c "John Doe" -g users john_doe
    4. Create a new user with multiple supplementary groups:
        useradd -G wheel,developers sarah
    5. Create a new user and explicitly specify the UID:
        useradd -u 1001 alex
    6. Create a new user with a home directory and ensure it is created:
        useradd -m -d /home/testuser testuser
    7. Create a new user without a home directory:
        useradd -M user_without_home
    8. Create a new user with specific defaults set in /etc/default/useradd:
        useradd -D -b /opt -s /bin/bash
    9. Create a new system user (UID below 1000):
        useradd -r system_user
    10. Create a new user interactively, prompting for details:
        useradd -i interactive_user

#usermod

      Options:
        -b, --badname                 allow bad names
        -c, --comment COMMENT         new value of the GECOS field
        -d, --home HOME_DIR           new home directory for the user account
        -e, --expiredate EXPIRE_DATE  set account expiration date to EXPIRE_DATE
        -f, --inactive INACTIVE       set password inactive after expiration
                                to INACTIVE
        -g, --gid GROUP               force use GROUP as new primary group
        -G, --groups GROUPS           new list of supplementary GROUPS
        -a, --append                  append the user to the supplemental GROUPS
                                      mentioned by the -G option without removing
                                      the user from other groups
        -h, --help                    display this help message and exit
        -l, --login NEW_LOGIN         new value of the login name
        -L, --lock                    lock the user account
        -m, --move-home               move contents of the home directory to the
                                      new location (use only with -d)
        -o, --non-unique              allow using duplicate (non-unique) UID
        -p, --password PASSWORD       use encrypted password for the new password
        -R, --root CHROOT_DIR         directory to chroot into
        -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
        -s, --shell SHELL             new login shell for the user account
        -u, --uid UID                 new UID for the user account
        -U, --unlock                  unlock the user account
        -v, --add-subuids FIRST-LAST  add range of subordinate uids
        -V, --del-subuids FIRST-LAST  remove range of subordinate uids
        -w, --add-subgids FIRST-LAST  add range of subordinate gids
        -W, --del-subgids FIRST-LAST  remove range of subordinate gids
        -Z, --selinux-user SEUSER     new SELinux user mapping for the user account

#userdel
userdel [options] username
     
      Options:
        -f, --force                   force some actions that would fail otherwise
                                      e.g. removal of user still logged in
                                      or files, even if not owned by the user
        -h, --help                    display this help message and exit
        -r, --remove                  remove home directory and mail spool
        -R, --root CHROOT_DIR         directory to chroot into
        -P, --prefix PREFIX_DIR       prefix directory where are located the /etc/* files
        -Z, --selinux-user            remove any SELinux user mapping for the user



usermod

#ammend | changes
chsh -s /bin/bash username    #chsh: Changes the login shell for a user.    
usermod -p password username    #usermod: Modifies user account properties, including password-related settings.



#sudo

ls -l /etc/sudoers
sudo -nv
sudo -l
sudo -l -U ansible    #test sudo
getent group sudo
sudo --list chmod
sudo --list passwd
sudo --validate
time timeout 2 sudo chmod --help
visudo -c
visudo -cf /tmp/sudoers
visudo -f /etc/sudoers.d/ansible
    ansible ALL=(ALL) NOPASSWD:ALL
-/etc/sudoers.d/ansible
    ansible ALL=(ALL) NOPASSWD:ALL
-usermod -aG wheel ansible
chmod 0440 /etc/sudoers.d/ansible    # The permissions should be set to “0440” (readable by root and not writable by others) to prevent unauthorized modifications.
ls -l /etc/sudoers.d/ansible    | stat /etc/sudoers.d/ansible 


sudo

sudo -s: Starts a new shell as the superuser.
sudo -i: Starts a new login shell as the superuser. It's similar to sudo -s, but with environment variables set as if you logged in directly as the superuser.
sudo -u username command: Executes the specified command with the privileges of the specified user.
sudo -l: Lists the permissions granted to you by sudo.
sudo -v: Updates the user's cached credentials, without executing a command.
sudo -k: Invalidates the user's cached credentials.
sudo -u username -i: Starts a new login shell as the specified user.
sudo -u username -s: Starts a new shell as the specified user.
sudo -b command: Runs the specified command in the background with superuser privileges.
sudo -A: Used in conjunction with a graphical sudo front-end to request a password via a GUI dialog.
sudo -H: Sets the HOME environment variable to the home directory of the target user.
sudo -E: Preserves the user's environment variables when running the command with sudo.
sudo -P: Preserves the value of the PATH environment variable when running the command with sudo.
sudo -S: Reads the password from standard input instead of a terminal device.
sudo -C: Checks the configuration file for syntax errors without running any commands.
sudo -V: Prints the sudo version and configuration information.
sudo -s -u username: Starts a shell with superuser privileges and switches to the specified user's shell.
sudo -l -U username: Lists the permissions granted to the specified user by sudo.

Best Practices for Linux User Management
1. Principle of Least Privilege
Grant users only the permissions they need to perform their tasks. Avoid giving unnecessary administrative privileges.

2. Regularly Review User Accounts
Periodically audit user accounts to remove inactive or unnecessary accounts, ensuring security and compliance.

3. Use Strong Password Policies
Enforce strong password policies using PAM configurations to require complex passwords and regular changes.

4. Monitor Login Attempts
Use tools like fail2ban or check logs in /var/log/auth.log to monitor failed login attempts and take action against potential intrusions.

5. Backup User Data Regularly
Ensure that user data is backed up regularly to prevent data loss due to accidental deletions or system failures.
