please run 'day3_challange_solution.sh'


sample output for the script day3_challange_solution.sh:


root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Invalid option, Please enter the correct user option!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --create

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to create the user account: user6
Enter password to create the account: user6
user account user6 has been created successfully!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --create

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to create the user account: user6
user user6 already existed, so please create the user with different username!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --reset

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to reset the user account password: user6
please enter a new password for user6:
user account user6 reset password has completed successfully!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --list

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Username   UID   GID
---------------------
root   0   0
daemon   1   1
bin   2   2
sys   3   3
sync   4   65534
games   5   60
man   6   12
lp   7   7
mail   8   8
news   9   9
uucp   10   10
proxy   13   13
www-data   33   33
backup   34   34
list   38   38
irc   39   39
gnats   41   41
nobody   65534   65534
systemd-network   100   102
systemd-resolve   101   103
messagebus   102   105
systemd-timesync   103   106
syslog   104   111
_apt   105   65534
tss   106   112
uuidd   107   113
tcpdump   108   114
sshd   109   65534
pollinate   110   1
landscape   111   116
fwupd-refresh   112   117
ec2-instance-connect   113   65534
_chrony   114   121
ubuntu   1000   1000
lxd   999   100
devops   1001   1001                                                                                                                                                user1   1002   1002
user2   1009   1003
user3   1010   1010
user44   1022   1011
user6   1023   1023

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --delete

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to delete the user account: user6
user account user6 has been deleted successfully!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --delete

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to delete the user account: user6
user user6 is not existed, so please choose a existed user to delete!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --help

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account


Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh -c

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to create the user account: user7
Enter password to create the account: user7
user account user7 has been created successfully!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --userinfo

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user7

 Username:  user7
 UID: 1024
 Home directory: /home/user7
 Default shell: /bin/sh

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --modusername

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's username:  user7
Enter new username that you wanted to modify for user user7:  user77
Successfully Updated the username from user7 to user77!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --userinfo

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user7
user user7 is not existed, so please choose an existed user to display more information about the user!

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --userinfo

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user77

 Username:  user77
 UID: 1024
 Home directory: /home/user7
 Default shell: /bin/sh

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --moduserid

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's user ID(UUID):  user77
Existed userID for user user77 is: 1024
Enter new userID that you wanted to modify for user user77:  1025
Successfully Updated the userID for user user77 from 1024 to 1025 !

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --userinfo

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user77

 Username:  user77
 UID: 1025
 Home directory: /home/user7
 Default shell: /bin/sh

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --modhome

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's default home directory:  user77
Default user home directory for user user77 is: /home/user7
Enter new user home directory that you wanted to modify for user user77:  /home/user77
Successfully Updated the home directory for user user77 from /home/user7 to /home/user77 !

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --userinfo

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user77

 Username:  user77
 UID: 1025
 Home directory: /home/user77
 Default shell: /bin/sh

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --modshell

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's default shell:  user77
Default Shell for user user77 is: /bin/sh
Enter new shell path that you wanted to modify for user user77:  /bin/bash
Successfully Updated the new Shell for user user77 from /bin/sh to /bin/bash !

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --userinfo

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user77

 Username:  user77
 UID: 1025
 Home directory: /home/user77
 Default shell: /bin/bash

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --modgroup

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's group:  user77
Existed group name for user user77 is: user7
Enter group name that you wanted to modify for user user77:  user4
Successfully Updated the new group for user user77 from user7 to user4 !

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --modpassage

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to add a account password expiration date: user77
Enter how many number of days password will expire for user user77:  120
passwd: password expiry information changed.
Successfully Updated the password expiry for user user77 !

Now the password expiry date information as follows...
Last password change                                    : Aug 02, 2023
Password expires                                        : Nov 30, 2023
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 120
Number of days of warning before password expires       : 7

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --modaccstatus

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to Lock/Unlock:  user77
Enter your choice 1 or 2:
choose 1 to Lock the user account
choose 2 to unlock the user account
1
user account user77 is locked successfully !

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# passwd -S user77
user77 L 08/02/2023 0 120 7 -1

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh --modaccstatus

Usage: ./day3_challenge_solution.py [OPTIONS]
Options:
   -c, --create    Create a new user account
   -d, --delete    Delete an existing user account
   -r, --reset     Reset password for an existing user account
   -l, --list      List all user accounts on the system
   -h, --help      Display this help and exit.

For Bonus features please use below options
   -ui, --userinfo Display more information about an existed user account
   -mu, --modusername Modify username for an existing user account
   -muid, --moduserid Modify user ID for an existing user account
   -mh,   --modhome  Modify home directory for an existing user account
   -ms,   --modshell  Modify default shell for an existing user account
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to Lock/Unlock:  user77
Enter your choice 1 or 2:
choose 1 to Lock the user account
choose 2 to unlock the user account
2
user account user77 is unlocked successfully !

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# passwd -S user77
user77 P 08/02/2023 0 120 7 -1



