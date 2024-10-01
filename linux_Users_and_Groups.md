# Linux Fundamentals

## Users and Groups

## 1. User Accounts

-   User accounts represent individual users on the Linux operating system.
-   Information about user accounts can be stored either locally or on another server.
-   Locally, this information is stored in the /etc/passwd file.
-   As a best practice, it is recommended to assign one user per user account and to avoid sharing accounts.

**Example**

The command sudo tail /etc/passwd will display the last 10 lines of the passwd file by default. You can adjust the number of lines shown by using the -n option followed by your desired number. For example, to display the last 5 lines:

```sh
tail -n 5 /etc/passwd
```

In this case, the file being displayed is the /etc/passwd, which contains user account information.

![passwd file](./img/passwd_file.png)
