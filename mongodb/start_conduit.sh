#!/bin/bash

set -eou pipefail

./reset_infra.sh

docker compose -f conduit-docker-compose.yaml up --wait --wait-timeout 20 --remove-orphans
