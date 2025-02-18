#!/bin/bash

set -eou pipefail

echo "Stopping infrastructure..."

docker compose -f infrastructure-docker-compose.yaml down

echo "Infrastructure stoppped."