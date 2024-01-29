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
12. If you need to add an additional security group rule, add the port and change the source type to anywhere usually.
    ![Add New Security Group Rule Screenshot](../README_images/Add_New_Security_Group_Rule_Screenshot.jpg)

13.	Check summary then click Launch instance

14.	Copy and paste link e.g. "chmod 400 tech242.pem" from next page into terminal
15.	Copy and paste link e.g. "ssh -i "tech242.pem" ubuntu@ec2-3-249-250-55.eu-west-1.compute.amazonaws.com" from next page into terminal
    ![Connect To Instance Screenshot](../README_images/Connect_To_Instance_Screenshot.jpg)

16.	Type and enter yes
17.	Should be connected/logged in, type exit to exit then manually stop on AWS website

# AWS Custom AMI Creation

AMIs (Amazon Machine Images) are like a snapshot or a template of a virtual computer that you can use as a starting point to create new virtual machines. It is like a pre-configured package that includes an operating system, software, and any additional configurations you need. In simple terms, an AMI is a blueprint for creating virtual machines in AWS. You can choose from a variety of publicly available AMIs or create custom ones to suit your specific requirements.

1. On your current running instance you want an image of, click on Actions, scroll down to Image and templates and select Create image.
   ![Create New Image Screenshot](../README_images/Create_New_Image_Screenshot.jpg)

2. Enter an image name e.g. "tech242-fergus-ready-to-run-java-atlas-app-ami"
3. Enter a description e.g. "Linux 22.04 LTS, maven, JDK 17, app folder"

4. Add a new tag at the bottom, key should be Name and the value should be the same as the image name you entered above
   ![AMI Tag Creation Screenshot](../README_images/AMI_Tag_Creation_Screenshot.jpg)

5. Once those details are entered, hit Create image in the bottom right hand corner.
6. You can then launch an instance from the AMI page you will be redirected to
   ![Launch Instance From AMI](../README_images/Launch_Instance_From_AMI_Screenshot.jpg)

7. Create instance as usual but your custom AMI will now be selected
8. If required make sure to include user data for commands such as cd or mvn spring-boot:start

# AMI Deregistering and Snapshot Deletion

1. Got to the AMIs by clicking AMIs on the left hand side of the screen under Images.
2. Find your specific AMI from the list, check the box and under the actions tab click deregister.
3. A pop up will open and you need to click delete snapshot then follow the hyperlink to open the snapshots in a new tab, this will lead you to the specific snapshot automatically
4. Go back to the AMI and confirm deregister.
5. Go back to the snapshot page, check the box and under actions click delete and confirm.

# Classic Ports To Know
- 22 = SSH (Secure Shell) - log in to Linux instance
- 21 = FTP (File Transfer Protocol) - upload files into a file share
- 22 = SFTP (Secure File Transfer Protocol) - upload files using SSH
- 80 = HTTP - access unsecured websites
- 443 = HTTPS - access secured websites
- 3380 = RDP (Remote Desktop Protocol) - log into a Windows instance

# EC2 Instance Purchasing Options

1. On-Demand Instances
Usage: Ideal for short-term, irregular workloads that cannot be interrupted.
Cost: Pay per second or per hour, depending on the instance type, with no long-term commitment.
Flexibility: Start and stop at any time; no upfront payment.

2. Savings Plans
Usage: Suitable for steady-state usage.
Cost: Offers significant savings over On-Demand pricing in exchange for a commitment to a consistent amount of usage (measured in $/hour) for a 1 or 3-year period.
Flexibility: Two types available - Compute Savings Plans (flexible across instance family, region, OS, or tenancy) and EC2 Instance Savings Plans (specific to instances within a family in a region).

3. Reserved Instances (RIs)
Usage: Best for applications with steady-state needs.
Cost: Up to 75% off the On-Demand price. Pricing varies based on the term length, payment option, and instance type.
Flexibility: Options include Standard RIs (significant discount, best for steady, predictable usage) and Convertible RIs (lower discount, can change the RI attributes).
Commitment: 1-year or 3-year term, with payment options including All Upfront, Partial Upfront, or No Upfront.

4. Spot Instances
Usage: Ideal for flexible, stateless, fault-tolerant, or time-insensitive tasks.
Cost: Up to 90% off the On-Demand price. Pricing fluctuates based on supply and demand.
Flexibility: Can be terminated by AWS with a two-minute notification when AWS needs the capacity back.
Risk: Higher risk of interruption compared to other options.

5. Dedicated Hosts
Usage: Necessary for regulatory requirements that may not support multi-tenant virtualization, or for licensing that doesn’t support cloud deployments.
Cost: Pay for the entire physical server. Can be more expensive than other options.
Flexibility: Physical EC2 server dedicated for your use.
Commitment: Available on-demand (hourly) or as a reservation for up to 70% off the On-Demand price.

6. Dedicated Instances
Usage: Similar to Dedicated Hosts but without the allocation of a physical server.
Cost: More expensive than standard instances but cheaper than Dedicated Hosts.
Flexibility: Instances run in a VPC on hardware that's dedicated to a single customer.
Differences from Dedicated Hosts: Instance capacity is not guaranteed, and instances can’t be used to bring your own license (BYOL).

# AWS Load Balancers

1. Application Load Balancer
- HTTP/HTTPS/gRPC protocols (Layer 7)
- HTTP Routing features
- Static DNS (URL)

2. Network Load Balancer
- TCP/UDP protocols (Layer 4)
- High Performance: millions of requests per second
- Static IP through Elastic IP

3. Gateway Load Balancer
- GENEVE Protocol on IP Packets (Layer 3)
- Route Traffic to Firewalls that you manage on EC2 instances
- Intrusion detection

# Snow Family
## Highly secure, offline, protable devices to collect and process data at the edge and/or migrate data in and out of AWS

1. Snowcone - Data Migration and Edge Computing
- Small, portable computing anywhere, rugged & secure and can withstand harsh environments
- Light
- Used in a space-constrained environment
- Must provide own battery/cables
- Can be sent back to AWS offline or connect it to the internet ans use AWS DataSync to send data
  - Snowcone: 8TB of HDD storage
  - Snowcone SSD: 14TB of HDD storage
- Use cases: Edge computing, stroage and data transfer

2. Snowball Edge - Data Migration and Edge Computing
- Physical transport solution intended to move TBs or PBs in or out of AWS
- Alternative to moving data over a network
- Pay per data transfer job (Data transfer in to Amazon S3 is free)
- Provides block storage and Amazon S3 compatible object storage
  - Snowball Edgee Storage Optimised: 80 TB HDD capacity
  - Snowball Edge Compute Optimised: 42 TB of HDD or 28TB NVMe capacity
- Use cases: Large data cloud migrations, DC commission or disaster recovery

3. Snowmobile - Data Migration
- Transfer exabytes of data (1EB = 1,000PB = 1,000,000TBs)
- Each Snowmobile has 100PB capacity (can use multiple in parallel)
- High security: temperature controlled, GPS and 24/7 video surveillance
- Better than Snowball if you transfer more than 10PB

AWS OpsHub is a UI for managing Snowball devices

# AWS Storage Gateway

- Bridge between on-premises data and cloud data in S3
- Use cases: Disaster recovery, backup & restore and tiered storage

# AWS Databases

## AWS RDS (Relational Database Service)
- A managed DB service using SQL
- Allows you to creates DBs in the cloud that are managed by AWS
  - Postgres
  - MySQL
  - MariaDB
  - Oracle
  - Microsoft SQL Server
  - Aurora (AWS Proprietary database)
### RDS vs Deploying DB on EC2
- Automated provisioning, OS patching
- Continuous backups and restore to specific timestamp (Point in Time Restore!)
- Monitoring dashboards
- Read replicas for improved read performance
- Multi AZ setup for disaster recovery
- Maintenance windows for upgrades
- Scaling capability (vertical and horizontal)
- Storage backed up by EBS
- You CANNOT SSH into your instances

## Amazon Aurora
- Proprietary technology from AWS (not open sourced)
- PostgreSQL and MySQL are both supported
- AWS cloud optimised and claims 5x performance improvement over MySQL on RDS and 3x of Postgres on RDS
- Storage automatically grows in increments of 10GB up to 128TB
- Cost 20% more than RDS but is more efficient
- Not in the free tier
### Aurora Serverless
- Automated database instatiation and auto-scaling based on actual usage
- PostgreSQL and MySQL both supported
- No capacity planning needed
- Least management overhead
- Pay per second, can be more cost effective
- Use cases: Good for infrequent, intermittent or unpredictable workloads

## RDS Deployments

### Read Replicas
- Scale the read workload of your DB
- Can create up to 15 Read Replicas
- Data is only written to the main DB

### Multi-AZ
- Failover in case of AZ outage (high availability)
- Creates replica in another AZ which is only used if the main DB fails
- Data is only read/written to the main DB
- Can only have 1 other AZ as failover

### Multi-Region (Read Replicas)
- Creates Read Replicas in other regions that our application can read, only writes to main DB
- Disaster recovery in case of region issue
- Local performance for global reads
- Replication cost
