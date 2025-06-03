#!/bin/bash

LOG_DIR="hospital_data/active_logs"
REPORT="reports/analysis_report.txt"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " CHOICE

case $CHOICE in
    1)
        FILE="heart_rate.log"
        ;;
    2)
        FILE="temperature.log"
        ;;
    3)
        FILE="water_usage.log"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

FULL_PATH="$LOG_DIR/$FILE"

if [ ! -f "$FULL_PATH" ]; then
    echo "Log file $FULL_PATH not found."
    exit 1
fi

echo "===== Analysis Report for $FILE =====" >> "$REPORT"
echo "Generated on: $DATE" >> "$REPORT"
echo "" >> "$REPORT"

awk -F'|' '{print $2}' "$FULL_PATH" | sort | uniq -c >> "$REPORT"

FIRST=$(head -1 "$FULL_PATH" | cut -d'|' -f1)
LAST=$(tail -1 "$FULL_PATH" | cut -d'|' -f1)

echo "" >> "$REPORT"
echo "First entry: $FIRST" >> "$REPORT"
echo "Last entry: $LAST" >> "$REPORT"
echo "==========================================" >> "$REPORT"
echo "" >> "$REPORT"

echo "Analysis complete. Report saved to $REPORT"

