#!/bin/bash

# Script 4: Log File Analyzer

# Command-line arguments
LOGFILE=$1
# Default keyword is 'error' if second argument is not provided
KEYWORD=${2:-"error"}
COUNT=0

# Ensure a log file was actually provided
if [ -z "$LOGFILE" ]; then
    echo "Usage: ./script4_analyzer.sh <path_to_log_file> [keyword]"
    echo "Example: ./script4_analyzer.sh /var/log/syslog warning"
    exit 1
fi

# Do-while style loop to handle missing or unreadable files
while [ ! -f "$LOGFILE" ] || [ ! -r "$LOGFILE" ]; do
    echo "Error: File '$LOGFILE' not found or not readable."
    read -p "Please enter a valid, readable log file path (or 'q' to quit): " NEW_PATH
    if [ "$NEW_PATH" == "q" ]; then
        echo "Exiting analyzer."
        exit 1
    fi
    LOGFILE="$NEW_PATH"
done

echo "Analyzing '$LOGFILE' for the keyword '$KEYWORD'..."
echo "--------------------------------------------------------"

# Enable case-insensitive matching natively in Bash for the loop
shopt -s nocasematch

# Read the file line by line safely using while-read loop
# Note: We use native Bash string matching here instead of 'echo $LINE | grep' 
# because spawning a 'grep' process for 100,000+ lines in syslog causes extreme hanging.
while IFS= read -r LINE; do
    # Check if the line contains the keyword (using built-in bash globbing)
    if [[ "$LINE" == *"$KEYWORD"* ]]; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# Revert case-insensitive matching back to default
shopt -u nocasematch

echo "SUMMARY: Keyword '$KEYWORD' was found $COUNT times."

# If matches were found, print the last 5 matching lines as requested in TODO
if [ $COUNT -gt 0 ]; then
    echo "--------------------------------------------------------"
    echo "Last 5 matching lines:"
    # Use grep to find all matches efficiently at once, then pipe to tail
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
fi
