# Linux Fundamentals

## Users and Groups

## User Accounts

-   User accoutns represent users on the Linux OS
-   Infomation about user accounts can be stored eitehr locally or on anohter server
-   Locally the infomration is stored in `/etc/passwd` file
-   As best practice it is recommedned to assign one user per one user account and it is advised to not share accounts

**Example**

Command `sudo tail /etc/passwd` will display the last 10 line of the `passwd` file. 10 is the default value, and it can be adjust by using `-n` option follwed by number you choose:

```sh
tail -n 5 /etc/passwd
```

![passwd file](./img/passswd_file.png)
