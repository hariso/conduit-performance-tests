#!/bin/bash

set -eou pipefail

./stop_infra.sh
./clean_up.sh

./reset_network.sh
./start_infra.sh

docker compose -f conduit-docker-compose.yaml up