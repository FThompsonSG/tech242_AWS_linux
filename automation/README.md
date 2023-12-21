# Levels of Automation

- [Levels of Automation](#levels-of-automation)
  - [Manual](#manual)
  - [Script](#script)
  - [User Data](#user-data)
  - [AMI Instances](#ami-instances)

## Manual
Once I had launched a virtual machine, the first step would be to SSH in and run commands manually to verify that each command works individually. This would be achieved by entering my IP address and port into my browser to confirm the app was up and running.

## Script
When the individual commands have been verified I moved on to the level of automation which was writing a script. I would start by creating the script file in the command terminal, planning the steps and order of the script with comment annotations and then moving my manual commands into said script including messages printed to the console to make my life easier with regards to keeping track of developments. I would then execute the script and again ensure that everything was working by checking the app in my web browser.

## User Data
Once I was satisfied that the script level of automation had been achieved, I moved on to user data. User data is script that you provide to the virtual machine prior to launching and the script is executed as part of the machines initialisation. This script only runs once. By providing my working script as user data to a new instance of a virtual machine, once it was initialised I was able to access my working app via the browser without having to SSH in to the virtual machine at all.

## AMI Instances
Finally once that instance or virtual machine was verified and running successfully, I created an Amazon machine image of that instance. Amazon machine images or AMIs are like a snapshot or a template of a virtual computer that you can use as a starting point to create new virtual machines. It is like a pre-configured package that includes an operating system, software, and any additional configurations you need. In simple terms, an AMI is a blueprint for creating virtual machines in AWS. So by creating an AMI of this working instance, I could in future launch instances from that AMI with everything required up and running and only a few lines of user data required when launching as opposed to requiring the entire script.