# MySQL

## Instructions for Ubuntu 22.04 LTS and later:

Run the following commands to install the MySQL community release:

1. Download the MySQL APT package from MySQL’s official website:

```bash
wget https://dev.mysql.com/get/mysql-apt-config_0.8.33-1_all.deb
```

2. Make sure you are in the same directory where you downloaded the MySQL APT package and run the following command:

```bash
sudo dpkg -i mysql-apt-config_0.8.33-1_all.deb
```

3. Update the Package List: After the APT config is installed, run an update:

```bash
sudo apt-get update
```

4. Install MySQL: You can then proceed to install MySQL with:

```bash
sudo apt-get install mysql-server
```

5. Enhance the security setting by running the following command:

```bash
sudo mysql_secure_installation
```

Then answer the **security settings** questions:

++**Temporary Root Password**++: If it's the first time you're setting up MySQL, you'll be prompted to enter the temporary root password that you retrieved from the MySQL logs using the earlier command (sudo grep 'temporary password' /var/log/mysqld.log). Enter this password.

++**Change the root password**++: You'll be prompted to change the root password. It's recommended that you set a strong password for MySQL’s root user.

++**Remove anonymous users**++: MySQL by default creates an anonymous user that anyone can use to connect without authentication. You’ll be asked if you want to remove this user. It’s a good practice to say yes.

++**Disallow remote root login**++: For security reasons, it's recommended to disallow root logins from remote locations. Answer yes to this prompt.

++**Remove the test database**++: A default MySQL installation includes a test database that anyone can access. You’ll be asked if you want to remove this. It’s a good idea to answer yes.

++**Reload privilege tables**++ Finally, you'll be asked if you want to reload the privilege tables, which ensures all changes take effect immediately. Say yes to this.

6. To login to mysql

```bash
mysql -h localhost -uroot -p
```

## Instructions for Linux AMI2

1. Run the following commands to install the MySQL community release:

```bash
sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum localinstall mysql57-community-release-el7-11.noarch.rpm
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
sudo yum install mysql-community-server
```

2. start the `mysqld` service and confirm it is running:

```bash
sudo systemctl start mysqld
sudo systemctl status mysqld
```

3. To get the default password:

```bash
sudo grep 'temporary password' /var/log/mysqld.log
```

4. Change the password

5. Enhance the security setting by running the following command:

```bash
sudo mysql_secure_installation
```

Then follow the instructions to improve the security of your MySQL installation (steps and recommendations are described in the instructions for Ubuntu 22.04 LTS and above).

6. To login to mysql

```bash
mysql -h localhost -uroot -p
```
