What is booting process in Linux?

what is inode in Linux?

What is CRONTAB?

1. In Ubuntu sever what is a public key and private key?

2. Write a script what you are done daily?

3. #chmod 444 <filename.txt?> in root user? Change the above permissions to 777?

4. #curl www.google.com is not working and telnet www.google.com is working now?

5. I am having two instances in public and private subnets, I am pinged from one server to 
another server and getting any response but by using telnet on port 23 it's working now?

6. What is SSL? And how it works internally?

7. Mostly asked on networking, ports, and protocols

what is os and what are differnt types of it ?

what is the architecture of os ? 

what is linux filesystem ?

How to create, remove, copy, move files & directories ?

what does ls -R do ?

how to copy directories from one location to another ? cp -rvfp

what is VIM editor and give brief intro about it ?

what are different types of files ?

what is the difference between softlink and hardlink ?

what does /etc/passwd tells ?

what does grep -v will do ?

tell me about some of the filter comands ?

sort -u <file name> is used for what purpose ?

what is sed ? 

what is find command command and give me one/two usecases of it ?

what are access mode types in filepermissions ? what are different levels that we can apply filepermissions ?

what are the different methods that we can use to set permissions ? Symbolic and absolute 

what does chmod command used for ?

chmod +x 700 what does it mean ?

what is umask ? it is a user file creation mask. it is a 4 digit octate number which tells unix what are the permissions to be denied rather than granted.  Umask decides what should be the default permissions for a file or directory when it is created. Default value is 0022 and umask is used to verify it

what is maximum full permission for a file & directory at the time of creation ?

what is partition and why we have multiple partitions ?

what is the structure of disk partition ?

what is mounting and explain /etc/fstab and /etc/mtab commands ?

what is fdisk -l or parted -l ? To view existing partitions

fdisk <diskname> ==> To enter into disk utility

updating partition table without restart ? partprobe <diskname> or partx -a <diskname>

 mkfs.<file system type> <partition name> --> to format a partition

 To see files which are open in disk --> lsof <diskname> 

 To view disk usage information and mounted partition --> df -h 

 du -h ? to view the size of file or directory

 e2label <partition name> <label> ---> to assign lable

 free -m ? to see memory size and swap size

 what are the steps to encrypt the partition ? Steps to Encrypt the Partition:<br>
1. Create a normal partition using fdisk.<br>
2. Format the partition using luks and assign the passphrase.<br>
3. Decrypt the partition.<br>
4. Now format again using normal ext4 formatting.<br>
5. Mount the partition, Make a permanent mount.<br>
6. Access the partition and add the data<br>
7. Unmount the partition, and close the partition i.e. encrypt back.<br>

Commands used in LUKs configuration :

cryptsetup luksformat, cryptsetup luksOpen, crypsetup luksClose, crypsetup luksAddkey 

Moving or Migrating the LV (data) from one pv to another.
 There might be a situation where the PV might be failing and it is required to be replaced, in
such case, we need to migrate or move the data from such PV to the other and isolate the 
PV.<br>
 The Steps to migrate the PV are : <br>
 Access the mount point of failing PV and check the data in it,<br>
 Verify the size of the PV by pvs command or pvdisplay command. <br>
 Unmount the file system on that PV. <br>
 Add new PV, which should be of the same size or higher than that of the replacing 
PV to the volume group. <br>

 Migrate the PVs contents to the new PV using following command <br>
 #pvmove <Old PV> <New PV>
 Mount back the LV, access the mount point and verify the data in it. <br>
 Remove the faulty PV from Volume Group. <br>

userid and user name are stored in which directory ? 

user's password is stored in which directory ?

how to set password to any user ?

how to change the password using multiple parameter ? chage -l/-L/-U

useradd -u/-G/-g/-d/-c/-s ? explain these terms

how to delete a user ? userdel 

/etc/group, groupadd, groupmod, usermod -G (To add single user to group), gpasswd -M/-A/-a/-d 


what are special permissions (SETUID,SETGID,STICKYBIT ) and Access Control list (ACL ) in linux ? steps to implement ACL
 Create a partition and format it with ext4 file system
 Mount a file system with ACL
 Apply ACL on it

To check acl permission --> getfacl -d/-R  <dir/filename>
To set permissions ---> setfacl -m/-x/-R <file/directory name>

#setfacl –m u: <username>: <permissions> <file or dir name>

what is difference between su and su - ?

difference between TCP and UDP ?

difference between cronjob and at job ?

what is the format of cronjob and give some of the commands related to cronjob ?

what are scp and rsync ?

how to find ip address of a server ?

why rpm -qa ?

what is tar -cvf, tar -xvf ?

what is ps -aux ? > To see offline process of the system that are already executed 

what are services and chkconfig files ? 

nice and renice are used to set priority of a process 

kill and 2o signal value for stopping process : kill -20 <pid>

ps -ef

what is difference between active and passive FTP ? The difference between the Active FTP and Passive FTP is based on who initiates the Data 
connection between the Server and the Client. If data connection is initiated by the Server, the 
FTP connection is active, and if the Client initiates the Data connection, FTP connection is 
passive.

Profile of ftp server
 Use : Ftp is used for uploading and downloading the files.
 Disadvantage : Directory cannot be uploaded or downloaded.
 Package : vsftpd 
 Daemon : vsftpd (Very Secure Ftp daemon)
 Script : /etc/initd/vsftpd
 Port no : 21 (Tcp) > 1024 (Udp, Random)
 Configuration files : /etc/vsftpd/vsftpd.conf
/etc/vsftpd/user_list
/etc/vsftpd/ftpuser
/etc/pam.d/vsftpd
 Document Root : /var/ftp
 Home directory : /var/ftp (which is created only when the package is 
installed.

difference between wget and curl ?

dns nameserver runs on port 53 


