# AWS Instance Launch Process

1.	Enter "cd .ssh" in the terminal to go to relevant directory
2.	Make sure you’re on the Ireland region near top right of screen 
3.	Click Launch Instance
4.	Name instance
5.	Search for AMI 20230424 Ubuntu ending in 1e9 in Community AMIs
    ![AMI Screenshot](../README_images/AWS_AMI_Screenshot.jpg)

6.	Instance Type – t2.micro Free Tier Eligible
7.	Select key pair – tech242
8.	Select existing security group or create new one if one does not exist
    ![Existing Secutiry Group Screenshot](../README_images/AWS_Security_Group_Existing_Screenshot.jpg)

9.	If creating, allow SSH (from your IP) and HTTP traffic
10.	Select my IP
    ![New Security Group Screenshot](../README_images/AWS_New_Security_Group_Screenshot.jpg)
11.	Provide security group name

12.	Check summary then click Launch instance

13.	Copy and paste link e.g. "chmod 400 tech242.pem" from next page
14.	Copy and paste link e.g. "ssh -i "tech242.pem" ubuntu@ec2-3-249-250-55.eu-west-1.compute.amazonaws.com" from next page
    ![Connect To Instance Screenshot](../README_images/Connect_To_Instance_Screenshot.jpg)

15.	Type and enter yes
16.	Should be connected/logged in, type exit to exit then manually stop on AWS website