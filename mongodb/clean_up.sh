#!/bin/bash

set -eou pipefail

echo "Cleaning up data..."

docker container prune -f
docker volume prune -f --filter all=true
sudo rm -rf data/

echo "Data clean-up finished."