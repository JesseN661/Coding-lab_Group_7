#!/bin/bash

LOG_DIR="hospital_data/active_logs"
DATE=$(date "+%Y-%m-%d_%H:%M:%S")

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " CHOICE

case $CHOICE in
    1)
        FILE="heart_rate.log"
        ARCHIVE_DIR="heart_data_archive"
        ;;
    2)
        FILE="temperature.log"
        ARCHIVE_DIR="temp_data_archive"
        ;;
    3)
        FILE="water_usage.log"
        ARCHIVE_DIR="water_data_archive"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

SOURCE="$LOG_DIR/$FILE"

if [ ! -f "$SOURCE" ]; then
    echo "Error: $SOURCE not found."
    exit 1
fi

mkdir -p "$ARCHIVE_DIR"

ARCHIVED_FILE="${FILE%.*}_$DATE.log"
mv "$SOURCE" "$ARCHIVE_DIR/$ARCHIVED_FILE"
touch "$SOURCE"

echo "Successfully archived to $ARCHIVE_DIR/$ARCHIVED_FILE"

