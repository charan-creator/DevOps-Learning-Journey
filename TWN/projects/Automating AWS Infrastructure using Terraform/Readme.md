<details><summary> Provision AWS Infrastructure for our project</summary> 
1. Custom VPC creation<br>2. Create custom subnet (1 subnet and 3 AZ) <br> 3.Create Routetable and internet gateway<br>4. Provision EC2 instance<br>5.Deploy Nginx Docker Container<br>6. Create security group (firewall)<br> </details>

In these project we are going to provision an EC2 instance on AWS infrastructure

Run Nginx Docker container on EC2 Instance

![alt text](image.png)



IAM User creation :
-------------------
Search for IAM on top search icon of your AWs Management console

You will see screen like below 👇
and click on users on left side (marked ) to create new IAM user

![alt text](image-1.png)

click on `create user` button

![alt text](image-2.png)

Give some name of your choice for me, it is `IT-Automation-Engineer`

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

Let's create Access Keys

![alt text](image-6.png)

select CLI as use-case and confirm

![alt text](image-7.png)

![alt text](image-8.png)

Don't share these access keys with anyone. These are individual's personal.



![alt text](image-9.png)