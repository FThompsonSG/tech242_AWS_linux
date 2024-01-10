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

## Creating Job To Merge Dev To Main
NB. Have not finished configuring the job for job 2.