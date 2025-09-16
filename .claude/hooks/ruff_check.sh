#!/bin/bash

# Run ruff check with fix option for Python files only
output=$(uv run ruff check --fix "$CLAUDE_PROJECT_DIR" --include "*.py" 2>&1)
exit_code=$?

# Print the output
echo "$output"

# Exit with appropriate code
if [ $exit_code -eq 0 ]; then
    # Success - no issues found or all issues fixed
    exit 0
elif [ $exit_code -eq 1 ]; then
    # Violations remain that couldn't be auto-fixed
    exit 2
else
    # Abnormal termination (exit code 2 or other)
    exit 2
fi