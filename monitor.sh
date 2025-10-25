#!/bin/bash
PIPELINE_DIR=~/data_pipeline
LOG_DIR=$PIPELINE_DIR/logs
LOG_FILE=$LOG_DIR/preprocess.log
SUMMARY_LOG=$LOG_DIR/monitor_summary.log

# Create directory if it doesn't exist
mkdir -p "$PIPELINE_DIR" "$LOG_DIR"

# Start new log section with timestamp header
RUN_START_TIME=$(date '+%Y-%m-%d %H:%M:%S')
echo -e "\n==== $RUN_START_TIME Starting Monitoring ====\n" | tee -a "$SUMMARY_LOG"

LAST_LOG=$(awk -v RS='' 'END{print}' "$LOG_FILE")

# Check for errors in the last log section
ERRORS=$(echo "$LAST_LOG" | grep -iE "ERROR|failed")

if [ -n "$ERRORS" ]; then
    echo "CHECKING LOGS FOR ERRORS IN LAST RUN..."
    echo "ERRORS FOUND IN LOGS FOR LAST PREPROCESS RUNS..., SEE ERROR DETAILS:"
    echo "--------------------------------------------------"
    echo "$ERRORS"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERRORS DETECTED IN LOG FILE!!!" | tee -a "$SUMMARY_LOG" > /dev/null
    echo "$ERRORS" >> "$SUMMARY_LOG"
else
    echo "No errors detected in logs."
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No errors found in Log file" | tee -a "$SUMMARY_LOG" > /dev/null
chmod 640 "$LOG_DIR/preprocess.log" "$LOG_DIR/monitor_summary.log"
fi
