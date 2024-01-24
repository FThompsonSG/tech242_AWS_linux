# Auto Scaling Groups
## AWS offers Auto Scaling groups to automatically adjust the number of VM instances based on defined scaling policies.

[Auto Scaling Groups Diagram](<../README_images/Auto Scaling Groups Diagram.pages>)

## Process For Creating Auto Scaling Group

1. Create instance and test it works.

2. Create AMI from instance and test it works.

3. Create launch template from AMI and test it works. Exactly the way you create and instance using your own AMI.

4. Go to Auto Scaling Groups at the bottom left hand side of the scroll bar, click and then on the next page click Create Auto Scaling Group.

5. Provide an appropriate name, select the launch template you created and then click next.
![Auto Scaling Creation - Page 1](<../README_images/Auto Scaling Creation - Page 1.jpg>)

6. On the next page scroll down to Network and tick the Availability Zones and subnets from the dropdown menu. Once done, click next.
![Availability Zones and Subnets](<../README_images/Availability Zones and Subnets Screenshot.jpg>)

7. On the next page click Attach to a new load balancer, make sure Application Load Balancer is selected, name it appropriately and make sure it is internet facing. Then create a new target group under Default routing and name it appropriately. Under health checks check the box for Turn on Elastic Load Balancing health checks then click next.

8. On the next screen set the desired group capacity to 2, the Min desired capacity to 2 and then Max desired capacity to 3. Check the box for Target Scaling policy, select the Metric type and target value you desire then select Prioritise availability below it. Finally click next.

9. Skip step 5 and on the next page add a name tag for your new VMs then click next.

10. On the final page review your configurations and once happy click Create Auto Scaling Group.

11. You should then be able to go to your instances and see that 2 will be running. If you go to Load Balancers, you can select yours, copy your DNS name into your browser and it should be working.

12. To delete you should delete your load balancer first, then target group and finally the auto scaling group.

- Launch Template: Can launch instance from AMI with additional details included e.g. user data, security group etc
- Scaling Policy: Metric, threshold, min desired and max amount of VMs
- Load Balancer: Chooses VM based on health and load

## Scaling Strategies

Manual Scaling: Update the size of the AG manually

Dynamic Scaling: Respond to changing demand
- Simple / Step Scaling
  - When a CloudWatch alarm is triggered (example CPU > 70%), then add 2 units
  - When a CloudWatch alarm is triggered (example CPU < 30%), then remove 1 unit
- Target Tracking Scaling
  - Example: I want the average ASG CPU to stay at around 40%
- Scheduled Scaling
  - Anticpate scaling based on known usage patterns
  - Example: Increase the min capacity to 10 at 5pm on Fridays
- Predictive Scaling
  - Uses Machine Learning to predict future traffic ahead of time
  - Automatically provisions the right number of EC2 instances in advance
  - Useful when your load has predictable time-based patterns