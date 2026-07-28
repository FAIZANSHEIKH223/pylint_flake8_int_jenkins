#!/bin/bash

set -e

APP_DIR="${1:-.}"

echo "========================================"
echo "Running Flake8"
echo "Application directory: ${APP_DIR}"
echo "========================================"

flake8 "${APP_DIR}" \
    --config="$(dirname "$0")/../.flake8"

echo "========================================"
echo "Flake8 completed successfully"
echo "========================================"
