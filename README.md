# DEC LaunchPad data_pipeline Linux Task
As a data engineer, was tasked to set up a data processing pipeline using Linux commands and bash scripts. This project would cover file manipulation, automation, permissions management, scheduling with cron, and logging.

## Create directories for organizing the pipeline:
- ~/data_pipeline/input
- ~/data_pipeline/output
- ~/data_pipeline/logs

## Data Ingestion and Preprocessing
- Simulate data ingestion by copying the dataset (sales_data.csv) into ```~/data_pipeline/input/.```
- Write a script preprocess.sh to clean and prepare the data files. The script should:
- Removes the extra_col column (last column).
- Filters out rows where status = Failed.
- Saves the cleaned version of the file into ```~/data_pipeline/output/cleaned_sales_data.csv.```
- Prints a success message and logs the action to ```~/data_pipeline/logs/preprocess.log.```
- Make preprocess.sh executable

## Automate the Pipeline with Cron Jobs
- Set up a cron job to automate data processing.
- Schedule preprocess.sh to run every day at midnight (12AM)
- Confirm the cron job is active by listing the scheduled jobs on the server.

## Logging and Monitoring
- Redirect output and error logs to the logs folder to monitor the pipeline’s progress.
- Write a monitor.sh script that checks for errors in the logs and notifies you if any are found.
 ```This script should:```
- Search for errors (e.g., "ERROR" or "failed") in log files.
- If errors are found, print them to the terminal or write to a summary log.
- Schedule this monitoring script to run after each daily processing job by adding it to cron (e.g., 12:05 AM).

## Permissions and Security
- Adjust permissions to secure files and directories:
- Set the input folder to be writable only by your user.
- Restrict access to logs so only authorized users can read them.

## Data_Pipeline file Structure
.

├── input

│   └── sales_data.csv

├── logs

│   └── preprocess.log

│   └── monitor_summary.log

├── monitor.sh

├── output

│   └── cleaned_sales_data.csv

└── preprocess.sh

## Cron Schedule for task

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/4fcd5cfc-ad15-44c3-a9ac-0d180225dda1" />

## Confirmation of schedule is Active

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/48279deb-31fb-4a14-888c-d8ae8957439d" />

