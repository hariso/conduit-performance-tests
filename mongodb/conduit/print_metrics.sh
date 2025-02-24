#!/bin/bash

set -euo pipefail

# Read start time from file
START_TIME=$(date -d "$(cat pipeline_start_time.txt)" +%s)

echo "Start time: $(cat pipeline_start_time.txt)"

# Target value to check for
TARGET_VALUE="2e+06"

while true; do
  # Get the current count from the metrics
  CURRENT_VALUE=$(curl -s localhost:8081/metrics | grep 'conduit_pipeline_execution_duration_seconds_count{pipeline_name="mongo-to-noop"}' | awk '{print $2}')

  # Check if it matches the target value
  if [[ "$CURRENT_VALUE" == "$TARGET_VALUE" ]]; then
    END_TIME=$(date +%s)
    ELAPSED=$((END_TIME - START_TIME))
    echo "✅ Target reached! Time elapsed: ${ELAPSED} seconds"
    break
  fi

  sleep 1
done
