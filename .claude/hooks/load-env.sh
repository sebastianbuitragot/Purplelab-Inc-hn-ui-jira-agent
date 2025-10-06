#!/bin/bash

# Hook script to load environment variables from .env file when Claude Code starts
# This script is called by Claude Code's SessionStart hook

# Get the project directory from Claude's environment variable
PROJECT_DIR="$CLAUDE_PROJECT_DIR"
ENV_FILE="$PROJECT_DIR/.env"

# Check if .env file exists
if [ ! -f "$ENV_FILE" ]; then
    echo "Warning: .env file not found at $ENV_FILE"
    exit 0
fi

# Load environment variables from .env file
# This exports variables to the current shell environment
set -a  # automatically export all variables
source "$ENV_FILE"
set +a  # stop automatically exporting

# Output the loaded environment variables for Claude's context
echo "Environment variables loaded from .env file:"
echo "Project directory: $PROJECT_DIR"
echo "Environment file: $ENV_FILE"

# List the variables that were loaded (excluding comments and empty lines)
echo "Loaded variables:"
grep -v '^#' "$ENV_FILE" | grep -v '^$' | while IFS='=' read -r key value; do
    if [ -n "$key" ]; then
        echo "  $key=***"  # Hide sensitive values
    fi
done

exit 0
