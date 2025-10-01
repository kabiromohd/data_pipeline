# DEC LaunchPad data_pipeline Linux Task
As a data engineer, was tasked to set up a data processing pipeline using Linux commands and bash scripts. This project would cover file manipulation, automation, permissions management, scheduling with cron, and logging.

## Create directories for organizing the pipeline:
- ~/data_pipeline/input
- ~/data_pipeline/output
- ~/data_pipeline/logs

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

