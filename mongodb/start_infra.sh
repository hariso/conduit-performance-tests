#!/bin/bash

set -eou pipefail

echo "Starting infrastructure..."

docker compose -f infrastructure-docker-compose.yaml up --wait --wait-timeout 20

# mongo-init needs some time
sleep 10

# Get broker health status
BROKER_HEALTH=$(docker inspect --format='{{.State.Health.Status}}' broker || echo "unknown")

# Get mongo-init running status and exit code
MONGO_RUNNING=$(docker inspect --format='{{.State.Running}}' mongo-init || echo "unknown")
MONGO_EXIT_CODE=$(docker inspect --format='{{.State.ExitCode}}' mongo-init || echo "unknown")

# Always print the statuses
echo "Broker Health: $BROKER_HEALTH"
echo "Mongo-init Running: $MONGO_RUNNING"
echo "Mongo-init Exit Code: $MONGO_EXIT_CODE"

# Check if broker is healthy
if [[ "$BROKER_HEALTH" != "healthy" ]]; then
    echo "Error: Container 'broker' is not healthy."
    exit 1
fi

# Check if mongo-init is still running
if [[ "$MONGO_RUNNING" == "true" ]]; then
    echo "Error: Container 'mongo-init' is still running, but it should have exited."
    exit 1
fi

# Check if mongo-init exited successfully
if [[ "$MONGO_EXIT_CODE" -ne 0 ]]; then
    echo "Error: Container 'mongo-init' did not exit successfully."
    exit 1
fi

echo "Infrastructure started."

