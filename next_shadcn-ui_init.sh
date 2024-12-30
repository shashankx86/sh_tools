#!/bin/bash

# Display help message
function display_help() {
  echo "Usage: $0 [PROJECT_NAME]"
  echo "
Options:
  -h    Display this help message.

Arguments:
  PROJECT_NAME   Name of the project to create. Defaults to '.' if not provided."
  exit 0
}

# Parse arguments
if [[ $1 == "-h" ]]; then
  display_help
fi

# Set project name to the first argument or default to '.'
PROJECT_NAME=${1:-.}

# Create the project
bun create next-app "$PROJECT_NAME"

# Change into the project directory (only if PROJECT_NAME is not '.')
if [[ $PROJECT_NAME != "." ]]; then
  cd "$PROJECT_NAME" || exit 1
fi

# Initialize shadcn
bunx --bun shadcn@latest init -d

echo "Project setup complete."
