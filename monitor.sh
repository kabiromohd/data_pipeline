#!/bin/bash

PIPELINE_DIR=~/data_pipeline
LOG_DIR=$PIPELINE_DIR/logs
LOG_FILE=$LOG_DIR/preprocess.log
SUMMARY_LOG=$LOG_DIR/monitor_summary.log

mkdir -p "$LOG_DIR"


ERRORS=$(grep -iE "ERROR|failed" $LOG_FILE)

if [ -n "$ERRORS" ]; then
    echo "Errors found in logs:"
    echo "$ERRORS"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERRORS DETECTED" >> "$SUMMARY_LOG"
    echo "$ERRORS" >> "$SUMMARY_LOG"
else
    echo "No errors detected in logs."
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No errors found" >> "$SUMMARY_LOG"
chmod 640 "$LOG_DIR/preprocess.log"
chmod 640 "$LOG_DIR/monitor_summary.log"
fi
