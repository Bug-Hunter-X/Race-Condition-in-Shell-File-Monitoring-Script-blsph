#!/bin/bash

# This script addresses the race condition by using flock to ensure exclusive access to the file.

while true; do
  # Correct: Use flock to acquire a lock on the file before processing
  flock -n -x /tmp/my_file.txt || continue # Non-blocking lock, skip if locked

  if [ -f /tmp/my_file.txt ]; then
    contents=$(cat /tmp/my_file.txt)
    echo "File contents: $contents"
  fi

  flock -u /tmp/my_file.txt # Unlock the file
  sleep 1
done