#!/bin/bash

set -eou pipefail

./reset_infra.sh

docker compose -f connect-docker-compose.yaml up --wait --wait-timeout 45
