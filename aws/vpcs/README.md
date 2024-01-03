# AWS VPCs (Azure Virtual Networks)

- On AWS by default you use a AWS public cloud: This is a building shared with everyone else using the public cloud.
- A default VPC is like a shared flat.
- A default subnet is like a room within the flat, associated with an availability zone.
- Routers utilised route tables which are private by default when creating a VPC and manage the connections.
- VPCs have an internet gateway, a door to the internet that can only be accessed by VMs in public subnets.
- CDIR blocks = 10.0.0.0/8 or 16 or 24 or 32 depending on how many bits we want to be locked.

## Setting up a VPC on AWS

1. Create VPC - Type VPC in search bar at top of screen and click top result. Click Create VPC at top of screen. Select VPC only as we want more control over what subnets, route trables etc are created. Name example "tech242-fergus-2-tier-vpc" and in IPv4 CIDR block enter "10.0.0.0/16". The tag for Name and the value will automatically generate. Select Create VPC.
   ![VPC Creation Screenshot](<../../README_images/Create VPC Screenshot.jpg>)

2. Create subnets - Click Subnets in the Virtual private cloud section on left of screen then on next page click Create subnet it top right hand corner. Select your VPC from dropdown menu then name your subnet e.g. "tech242-fergus-public-subnet". Select the first availability zone and provide subnet CIDR block e.g. "10.0.2.0/24". Do same for second subnet but choosing second availability zone and 3 instead of 2 for the IP CIDR block. Click create subnet.
   ![Subnet Creation Screenshot](<../../README_images/Subnet Creation Screenshot.jpg>)

3. Create internet gateway - Click Internet gateways in the Virtual private cloud section on left of creen then on next page click Create internet gateway in top right hand corner. Name your internet gateway e.g. "tech242-fergus-2-tier-vpc-ig" then click create internet gateway. 

4. Attached gateway to VPC - Once internet gateway is created click Attach to a VPC at top of screen. Select your VPC then click Attache internet gateway.

5. Create route table - Click Route tables in the Virtual private cloud section on left of screen then on next page click Create route table in top right hand corner. Name your route table e.g. "tech242-fergus-2-tier-vpc-public-rt", select your VPC from drop down menu and click Create route table.

6. Associate public route table with subnet - Click Subnet associations below route table details window, then click Edit subnet associations in the Explicit subnet associations window. Tick the public subnet and click Save associations.

7. Add internet gateway to route table - Click Edit route, click Add route, select 0.0.0.0/0 as the IP address and then Internet Gateway from the dropdown. Select your internet gateway from dropdown below and finally click Save changes.
![Adding Internet Gateway To Route Table Screenshot](<../../README_images/Adding Internet Gateway To Route Table Screenshot.jpg>)

8. Check VPC set up correctly

9.  Set up DB VM - Only difference is create new security group, select your VPC, private subnet and disable Auto-assign public IP. Select the ssh Source type to be My IP and input a new security group rule for MYSEQL with Source type of Anywhere.

10. Set up app VM - Only difference is create new security group, select your VPC, public subnet and enable Auto-assign public IP. Select the ssh Source type to be My IP and input a new security group rule for necessary ports with Source type of Anywhere.