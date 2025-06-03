# Group Project: Automated Log Management System

## Objective
A system to manage logs from health monitoring devices (heart rate, temperature, and water usage), allowing archiving and analysis.

## Team Members
- Member 1: Project Manager
- Member 2: Archival Script
- Member 3: Analysis Script
- Member 4-6: Python Device Simulators
- Member 7: Tester/Debugger

## Folder Structure
hospital_data/
├── active_logs/
│ ├── heart_rate.log
│ ├── temperature.log
│ └── water_usage.log
heart_data_archive/
temp_data_archive/
water_data_archive/
reports/
├── analysis_report.txt
## How to Run

1. Start device simulators (in separate terminals):
python3 heart_monitor.py start
python3 temp_sensor.py start
python3 water_meter.py start

2. Archive logs:

3. Analyze logs:

## Tools Used
- Shell Scripting (bash)
- Linux commands: `mv`, `touch`, `awk`, `grep`, `sort`, `uniq`

