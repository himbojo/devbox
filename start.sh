#!/bin/bash

[ -d "/workspace" ] || mkdir -p "workspace"

export INSTALL_EXTRA=false

# Loop through all arguments
for arg in "$@"; do
  if [ "$arg" == "--extra" ]; then
    export INSTALL_EXTRA=true
  fi
done

docker-compose up --build -d
# docker-compose build --no-cache
# docker-compose up -d