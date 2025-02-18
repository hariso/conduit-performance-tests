#!/bin/bash

set -eou pipefail

docker compose -f connect-docker-compose.yaml down

./stop_infra.sh
