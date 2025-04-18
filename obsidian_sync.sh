#!/usr/bin/env bash

TIME=$(date +"%d/%m/%Y_%H:%M:%S:%N")
VAULT="$HOME/obsidian/"

echo "====================="
echo "Starting sync: $TIME"
echo "====================="

cd $VAULT || { echo "Failed to change directory to $VAULT" ; exit 1; }

# Avoid conflict by pulling latest changes first
echo "Running git pull..."
git pull origin main --rebase

echo "Running git add..."
git add . 

echo "Running git commit..."
git commit -m "Automated Sync: $TIME" || echo "No changes to commit"

echo "Running git push..."
git push origin main || exit 1

echo "====================="
echo "Finished sync: $TIME"
echo "====================="
