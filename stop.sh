#!/bin/bash
echo "Finding ssh-key to remove..."
key_to_remove=$(ssh-keyscan -H -p 2222 -t rsa "localhost" 2>/dev/null)
echo "Extracting key..."
key_only="${key_to_remove#*ssh-rsa }"
echo "Removing key..."
grep -vF "$key_only" ~/.ssh/known_hosts > ~/.ssh/known_hosts.tmp && mv ~/.ssh/known_hosts.tmp ~/.ssh/known_hosts

echo "Bringing down the container..."
docker-compose down --rmi all