#!/bin/bash

PIPELINE_DIR=~/data_pipeline
INPUT_DIR=$PIPELINE_DIR/input
OUTPUT_DIR=$PIPELINE_DIR/output
API_URL="https://raw.githubusercontent.com/dataengineering-community/launchpad/refs/heads/main/Linux/sales_data.csv"
CSV_FILE="$INPUT_DIR/sales_data.csv"
INPUT_FILE=$INPUT_DIR/sales_data.csv
LOG_DIR=$PIPELINE_DIR/logs
OUTPUT_FILE=$OUTPUT_DIR/cleaned_sale_data.csv
LOG_FILE=$LOG_DIR/preprocess.log

# Create directories
mkdir -p "$PIPELINE_DIR"
mkdir -p "$INPUT_DIR" "$LOG_DIR" "$OUTPUT_DIR"

echo "Downloading sales data from API..."
if wget "$API_URL" -q -O "$CSV_FILE"; then
    echo "Download successful. File saved to $CSV_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCCESS: CSV Data Downloaded file from $API_URL" >> "$LOG_FILE"

    # Preprocess CSV: Remove rows with failed in the last column and drop the last column
    echo "Preprocessing data..."
    awk 'BEGIN{FS=OFS=","} {
    NF--;
    if (NR==1 || tolower($NF) != "failed")
        print
    }' "$INPUT_FILE" > "$OUTPUT_FILE"
    echo "Preprocessing complete. Cleaned file saved at $OUTPUT_FILE"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - SUCCESS: Data Preprocessed $INPUT_FILE -> $OUTPUT_FILE" >> "$LOG_FILE"
else
    echo "Download failed from $API_URL"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ERROR: CSV Data Download failed from $API_URL" >> "$LOG_FILE"
    exit 1
chmod 755 "$INPUT_DIR"
fi
