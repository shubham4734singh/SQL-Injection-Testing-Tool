#!/bin/bash

# SQL Injection Test Tool
# Author: PennTest GPT
# Usage: ./sql_injection_test.sh http://example.com/index.php?user=1

# Check if URL parameter is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <target-url>"
  exit 1
fi

TARGET_URL=$1
PAYLOADS_FILE="payloads.txt"
PYTHON_SCRIPT="sql_injection_tester.py"

# Check if payload file exists
if [ ! -f $PAYLOADS_FILE ]; then
  echo "Payloads file ($PAYLOADS_FILE) not found!"
  exit 1
fi

# Check if Python script exists
if [ ! -f $PYTHON_SCRIPT ]; then
  echo "Python script ($PYTHON_SCRIPT) not found!"
  exit 1
fi

# Loop through each payload in the payloads.txt file
while IFS= read -r PAYLOAD; do
  echo "Testing payload: $PAYLOAD"
  
  # Pass payload and URL to the Python script for testing
  python3 $PYTHON_SCRIPT "$TARGET_URL" "$PAYLOAD"
  
  echo "------------------------------------"
done < $PAYLOADS_FILE
