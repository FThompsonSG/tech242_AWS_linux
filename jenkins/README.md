# Jenkins

## Creating and Monitoring a Job
1. Use IP and port provided in your browser, then log in using details provided.
2. Select create job.
3. Enter an item (job) name, select Freestyle project and click OK.
![Job Creation Screenshot](<../README_images/Job Creation Screenshot.jpg>)
4. You will be taken to the congiure screen where you enter a description, check Discard old builds, check GitHub project with the HTTPS URL (if on GitHub) and set Max # of builds to keep to 3.
5. Add a build step with whatever bash command you require.
6. If you have an existing job and want to chain them, click Add post-build action, select Build project, enter the name of the job (which should autocomplete) and ensure Trigger only if build is stable.
7. Hit save.
8. Go to the dashboard, click the arrow next to your job an then hit build.
9. You will then be able to go to the job, click on the build you want under Build History, then click console output.
![Job Console Output Screenshot](<../README_images/Job Console Output Screenshot.jpg>)

## Source Code Management
1. Click Git
2. Enter URL for git repo
3. Click add credentials
4. Change Kind to SSH Username with private key
5. Provide and ID and username (same one) for the key
6. Enter a description of what the key is for
7. Check Enter directly, then Add and copy and paste entire contents of private key
8. Changes Branches to build from master to main
![Source Code Management Screenshot](<../README_images/Jenkins Source Code Management Screenshot.jpg>)

## Build Steps
1. Click Invoke top-level Maven targets
2. In goals type "package test"
3. Click on advanced drop down
4. In POM type path to POM e.g. springapi/pom.xml
5. Click save
![Build Steps Screenshot](<../README_images/Jenkins Build Steps Screenshot.jpg>)

## Web Hook
1. On your job, go to configure and then down to Build Triggers and check GitHub hook trigger for GITScm polling
![Jenkins Webhook Configuration Screenshot](<../README_images/Jenkins Webhook Trigger Screenshot.jpg>)
2. On GitHub go to the settings on your repo, select Webhooks on the left and then click Add webhook.
3. For the Payload URL enter the IP and port of Jenkins, followed by github-webhook/ and finally click Add webhook.
![GitHub Webhook Configuration Screenshot](<../README_images/GitHub Webhook Config Screenshot.jpg>)

## Creating Job 2 To Merge Dev To Main
1. Create job, check Discard old build and select 3 as the max.
2. Check GitHub project and enter the HTTPS URL.
3. Under Source Code Management click Git, enter the SSH URL and select your credentials. Enter dev as the Branch Specifier under Branches to build. Click on Additional Behaviours with the Name of repository as origin and Branch to merge to as main. 
4. Go down to Post-build Actions, check Push Only If Build Succeeds and Merge Results, click Add Branch and set the branch to push main and target remote name origin.
![Job 2 Merge Post Build Actions](<../README_images/Jenkins Job 2 Merge Post Build Actions Screenshot.jpg>)
5. Got to job 1, scroll down to Post-build actions, Add post-build actions, enter the name of job 2 and check Trigger only if build is stable.
![Attach Job 2 To Job 1](<../README_images/Jenkins Attach Job 2 to Job 1 Screenshot.jpg>)

## Creating Job 3 To Add Main Branch Code To Instance And Deploy
1. Ensure you have a working instance running first.
2. Create job, check Discard old build and select 3 as the max.
3. Check GitHub project and enter the HTTPS URL.
4. Under Build Environment check SSH Agent and select the .pem file relating to the instance.
![Job 3 SSH Agent Screenshot](<../README_images/Jenkins Job 3 SSH Agent Screenshot.jpg>)
5. Scroll down to Build Steps, Add build step, Execute shell and then input script.

ls -al
scp -o StrictHostKeyChecking=no -r ../fergus-jsonvh-job1-ci-test/springapi ubuntu@ec2-18-201-195-95.eu-west-1.compute.amazonaws.com:~

scp -o StrictHostKeyChecking=no -r ../fergus-jsonvh-job1-ci-test/TestResults ubuntu@ec2-18-201-195-95.eu-west-1.compute.amazonaws.com:~

ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-201-195-95.eu-west-1.compute.amazonaws.com "cd ~/springapi; mvn clean package spring-boot:start"