#!/bin/bash

# This script attempts to process a file, but it has a subtle race condition.
# The problem is that the file processing happens in a loop that's constantly checking for updates.
# If the file is updated while the script is reading it, the script might misinterpret the data.

while true; do
  # Incorrect: We're checking the file in a loop without proper synchronization
  if [ -f /tmp/my_file.txt ]; then
    contents=$(cat /tmp/my_file.txt)
    echo "File contents: $contents"
  fi
  sleep 1
done