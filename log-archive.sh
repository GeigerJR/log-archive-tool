#!/bin/bash

# Check if a directory was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <log-directory>"
  exit 1
fi

LOG_DIR=$1

# Check if the directory exists
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Directory $LOG_DIR does not exist."
  exit 1
fi

# Create archive directory if it doesn't exist
ARCHIVE_DIR="./archives"
mkdir -p "$ARCHIVE_DIR"

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive file name
ARCHIVE_FILE="logs_archive_${TIMESTAMP}.tar.gz"

# Compress logs
tar -czf "$ARCHIVE_DIR/$ARCHIVE_FILE" "$LOG_DIR"

# Log operation
echo "Archived $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_FILE at $(date)" >> archive_log.txt

echo "✅ Logs archived successfully!"
