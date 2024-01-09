# Jenkins

1. Use IP and port provided in your browser, then log in using details provided.
2. Select create job.
3. Enter an item (job) name, select Freestyle project and click OK.
![Job Creation Screenshot](<../README_images/Job Creation Screenshot.jpg>)
4. You will be taken to the congiure screen where you enter a description, check Discard old builds and set Max # of builds to keep to 3.
5. Add a build step with whatever bash command you require.
6. If you have an existing job and want to chain them, click Add post-build action, select Build project, enter the name of the job (which should autocomplete) and ensure Trigger only if build is stable.
7. Hit save.
8. Go to the dashboard, click the arrow next to your job an then hit build.
9. You will then be able to go to the job, click on the build you want under Build History, then click console output.
![Job Console Output Screenshot](<../README_images/Job Console Output Screenshot.jpg>)