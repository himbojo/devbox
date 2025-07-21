#!/bin/bash

echo "If workspace folder does not exist create it..."
[ -d "/workspace" ] || mkdir -p "workspace"
[ -d "/.vscode-server" ] || mkdir -p ".vscode-server"

export INSTALL_EXTRA=false

# Loop through all arguments
for arg in "$@"; do
  if [ "$arg" == "--extra" ]; then
    echo "--extra has been set."
    export INSTALL_EXTRA=true
  fi
done

echo "Bringing up the container..."
docker-compose up --build -d