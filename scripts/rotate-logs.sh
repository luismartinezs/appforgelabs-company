#!/bin/bash

# Rotate conversation logs weekly
# This script should be run weekly via cron

set -e

REPO_DIR="/home/deploy/appforgelabs-company"
LOG_FILE="logs/conversation.md"

cd "$REPO_DIR"

if [ -f "$LOG_FILE" ]; then
    WEEK_YEAR=$(date +%G-%V)
    NEW_LOG_NAME="logs/conversation-${WEEK_YEAR}.md"

    mv "$LOG_FILE" "$NEW_LOG_NAME"
    git add logs/conversation-*.md
    git commit -m "ops: rotate conversation logs"
    git push origin main

    echo "Log rotated successfully to $NEW_LOG_NAME"
else
    echo "No conversation log found to rotate"
fi