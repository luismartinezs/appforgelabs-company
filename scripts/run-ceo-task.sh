#!/bin/bash

# Run daily CEO tasks
# This script should be run daily via cron

set -e

REPO_DIR="/home/deploy/appforgelabs-company"
TASK_FILE="./tasks/ceo-daily-reminder.md"
LOG_FILE="logs/conversation.md"

cd "$REPO_DIR"

# Execute CEO task and append to log
claude -p "Use the atlas-ceo subagent to handle task $TASK_FILE" --dangerously-skip-permissions >> "$LOG_FILE" 2>&1

# Commit and push the log
git add "$LOG_FILE"
git commit -m "ops: append conversation log" || true
git push origin main