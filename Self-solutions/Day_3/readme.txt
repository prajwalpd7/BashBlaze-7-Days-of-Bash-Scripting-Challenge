please run 'day3_challange_solution.sh'


sample output for the script day3_challange_solution.sh:

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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to create the user account: user3
Enter password to create the account: user3
user account user3 has been created successfully!
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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to create the user account: user3
user user3 already existed, so please create the user with different username!
root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh -r

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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to reset the user account password: user3
please enter a new password for user3:
user account user3 reset password has completed successfully!
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

############## Below options are for the future implementation ##############################
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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to delete the user account: user3
user account user3 has been deleted successfully!
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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to delete the user account: user3
user user3 is not existed, so please choose a existed user to delete!

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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: devops

 Username:  devops
 UID: 1001
 Home directory: /home/devops
 Default shell: /bin/bash

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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to create the user account: user4
Enter password to create the account: user4
user account user4 has been created successfully!

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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's username:  user4
Enter new username that you wanted to modify for user user4:  user44
Successfully Updated the username from user4 to user44!
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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user44

 Username:  user44
 UID: 1011
 Home directory: /home/user4
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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's user ID(UUID):  user44
Existed userID for user user44 is: 1011
Enter new userID that you wanted to modify for user user44:  1022
Successfully Updated the userID for user user44 from 1011 to 1022 !
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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user44

 Username:  user44
 UID: 1022
 Home directory: /home/user4
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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's default home directory:  user44
Default user home directory for user user44 is: /home/user4
Enter new user home directory that you wanted to modify for user user44:  /home/user44
Successfully Updated the home directory for user user44 from /home/user4 to /home/user44 !

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh -ui

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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user44

 Username:  user44
 UID: 1022
 Home directory: /home/user44
 Default shell: /bin/sh

root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh -ms

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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username that you wanted to modify it's default shell:  user44
Default Shell for user user44 is: /bin/sh
Enter new shell path that you wanted to modify for user user44:  /bin/bash
Successfully Updated the new Shel for user user44 from /bin/sh to /bin/bash !
root@ip-172-31-91-38:~/BashBlaze-7-Days-of-Bash-Scripting-Challenge/Self-solutions/Day_3# ./day3_challenge_solution.sh -ui

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

############## Below options are for the future implementation ##############################
   -mg,   --modgroup  Modify group for an existing user account
   -mpa,  --modpassage Modify password expiration date for an existing user account
   -mas,  --modaccstatus Modfiy account status(Lock/Unlock) for an existing user account

Enter username to know more information about the user account: user44

 Username:  user44
 UID: 1022
 Home directory: /home/user44
 Default shell: /bin/bash


