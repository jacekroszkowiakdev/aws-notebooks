# Linux Command Guide

| Purpose                  | Command                                          | Additional Info                         |
| ------------------------ | ------------------------------------------------ | --------------------------------------- | ------------------------- |
| Users                    | `/etc/passwd                                     | cut -d: -f1`                            | Avoids other info         |
| Groups                   | `/etc/group`                                     |                                         |
| Current directory        | `pwd`                                            | Print working directory                 |
| Current user             | `whoami`                                         |                                         |
| Currently logged users   | `who -H -a`                                      | `-a = -bTu`                             |
| Current user info        | `id`                                             |                                         |
| Hostname                 | `hostname`                                       | `hostname -s` (shortened)               |
| Uptime                   | `uptime`                                         |                                         |
| Time and date            | `date`                                           |                                         |
| Calendar                 | `cal`                                            |                                         |
| Print                    | `echo 'xxxxx'`                                   |                                         |
| Command history          | `history`                                        | `!123` (specific), `!!` (last)          |
| History search           | `CTRL + R`                                       | Type and enter                          |
| Create a file            | `touch <filename>`                               |                                         |
| List directory items     | `ls`                                             |                                         |
| Display file content     | `cat <filename>                                  | more`                                   | `less`, OPTIONS, filename |
| Output bottom to top     | `tail -n (no.)`                                  | `-f` (live), `-r` (reverse)             |
| Output top to bottom     | `head -c (count)`                                |                                         |
| Simple user creation     | `useradd <username> -c (cmmt) -e (exp) -d (dir)` |                                         |
| Detailed user creation   | `useradd -m -s /bin/bash -G sudo <username>`     |                                         |
| Stepwise user creation   | `adduser <username>`                             |                                         |
| User modification        | `usermod <username>`                             |                                         |
| Deleting user            | `userdel <username> -r`                          | `-r` (delete home directory)            |
| User password            | `passwd <username>`                              |                                         |
| Group creation           | `groupadd <groupname>`                           |                                         |
| Group modification       | `groupmod <groupname> -n new_group old_group`    |                                         |
| Group deletion           | `groupdel <groupname>`                           |                                         |
| Adding user to group     | `usermod -aG <group(s)> <user>`                  | `-a` (append to avoid removal)          |
| Adding user to group     | `gpasswd -a <user> <group>`                      | `-M` (members), `-A` (admins)           |
| Deleting user from group | `gpasswd -d <user> <group>`                      |                                         |
| Switching user           | `su <user>`                                      | `su - <user>` (enters user environment) |
| Sudoers file             | `/etc/sudoers`                                   | Who, Where, What                        |
| Sudo                     | `sudo -l -U <username>`                          | To see privileges                       |
