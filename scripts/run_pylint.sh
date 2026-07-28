#!/bin/bash

set -e

APP_DIR="${1:-.}"

echo "========================================"
echo "Running Pylint"
echo "Application directory: ${APP_DIR}"
echo "========================================"

pylint "${APP_DIR}" \
    --rcfile="$(dirname "$0")/../.pylintrc"

echo "========================================"
echo "Pylint completed successfully"
echo "========================================"
