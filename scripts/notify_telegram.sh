#!/bin/bash

# Script to send notifications to Telegram channel
# Usage: ./notify_telegram.sh "Your message here"

set -euo pipefail

# Check if message is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 \"message\""
    echo "Example: $0 \"Deployment completed successfully\""
    exit 1
fi

MESSAGE="$1"

# Load environment variables from .env file
if [ -f .env ]; then
    set -a
    source .env
    set +a
else
    echo "Error: .env file not found"
    echo "Please create a .env file with TELEGRAM_BOT_TOKEN and TELEGRAM_CHAT_ID"
    exit 1
fi

# Check required environment variables
if [ -z "${TELEGRAM_BOT_TOKEN:-}" ]; then
    echo "Error: TELEGRAM_BOT_TOKEN not set in .env file"
    exit 1
fi

if [ -z "${TELEGRAM_CHAT_ID:-}" ]; then
    echo "Error: TELEGRAM_CHAT_ID not set in .env file"
    exit 1
fi

# Send message to Telegram
TELEGRAM_URL="https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage"

# Escape message for JSON
ESCAPED_MESSAGE=$(printf '%s' "$MESSAGE" | sed 's/\\/\\\\/g; s/"/\\"/g; s/\x08/\\b/g; s/\x0c/\\f/g; s/\n/\\n/g; s/\r/\\r/g; s/\t/\\t/g')

response=$(curl -s -X POST "$TELEGRAM_URL" \
    -H "Content-Type: application/json" \
    -d "{\"chat_id\": \"$TELEGRAM_CHAT_ID\", \"text\": \"$ESCAPED_MESSAGE\"}")

# Check if message was sent successfully
if echo "$response" | grep -q '"ok":true'; then
    echo "Message sent successfully to Telegram"
else
    echo "Error sending message to Telegram:"
    echo "$response"
    exit 1
fi