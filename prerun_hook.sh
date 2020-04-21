#! /bin/bash

set -e

echo "$CONFIG" | envsubst > /app/config.yml
