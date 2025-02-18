#!/bin/bash

set -eou pipefail

docker compose -f conduit-docker-compose.yaml down

./stop_infra.sh
