# Monitoring and Alert Management

[Monitoring Diagram](<../README_images/Monitoring Diagram.pdf>)

- Monitoring is important as it will ensure a higher availability than without monitoring. Without monitoring if the CPU load is too high then the VM may/will fall over.
- By monitoring we can ensure that we have things in place to happen when a load threshold is broken such as and alarm or auto scaling.
- It is beneficial to turn on detailed monitoring as it provides second by second updates of metrics as opposed to every five minutes.

## Dashboard Monitoring Process
1. On instance screen, click monitoring tab.

2. Click Manage detailed monitoring, click enable/disable and confirm.

3. Click add to dashboard.
   ![Instance Monitoring Tab](<../README_images/Instance Monitoring Tab Screenshot.jpg>)

4. On next tab that opens, either select an existing dashboard from the drop down menu or click create to create a new one.

5. Name your new dashboard, click create and then Add to dashboard.

6. You can maximise as specific metric window, set it to update more frequently e.g. every minute and customise the period it currently shows you.
   ![CPU Utilization Metric Window](<../README_images/Dashboard CPU Utilization Screenshot.jpg>)

## Creating an Alarm
7. To create an alarm, on the instance screen once you have created your dashboard then select the three lines on the left hand side of the screen selet Alarms then All alarms.

8. Select Create alarm, Select metric, select EC2, then  Per-Instance Metrics and paste in your instance ID, select CPUUtilization and click Select metric.

9. On the next screen under Specify metric and conditions, select Average for Statistic and confirm the period e.g. 1 minute.

10. Within Conditions choose Static for the Threshold type, select Greater and then input the desired threshold.

11. Choose breach threshold and then hit next.

12. On the next screen under Notification, make sure In alarm is selected and create SNS topic. Give it a name and then enter your email address. Hit next.

13. Enter name and desription for the alarm, click Preview and create and then Create alarm.

   ![Alarm Email Notification](<../README_images/Alarm Email Notification Screenshot.jpg>)