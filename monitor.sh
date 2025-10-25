#!/bin/bash
PIPELINE_DIR=~/data_pipeline
LOG_DIR=$PIPELINE_DIR/logs
LOG_FILE=$LOG_DIR/preprocess.log
SUMMARY_LOG=$LOG_DIR/monitor_summary.log

# Create directory if it doesn't exist
mkdir -p "$PIPELINE_DIR" "$LOG_DIR"

LAST_LOG=$(awk -v RS='' 'END{print}' "$LOG_FILE")

# Check for errors in the last log section
ERRORS=$(echo "$LAST_LOG" | grep -iE "ERROR|failed")

# Check for errors in the preprocess log
#ERRORS=$(grep -iE "ERROR|failed" $LOG_FILE)

if [ -n "$ERRORS" ]; then
    echo "Errors found in logs, see error details:"
    echo "--------------------------------------------------"
    echo "$ERRORS"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERRORS DETECTED IN LOG FILE!!!" | tee -a "$SUMMARY_LOG" > /dev/null
    echo "$ERRORS" >> "$SUMMARY_LOG"
else
    echo "No errors detected in logs."
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No errors found in Log file" | tee -a "$SUMMARY_LOG" > /dev/null
chmod 640 "$LOG_DIR/preprocess.log" "$LOG_DIR/monitor_summary.log"
fi
