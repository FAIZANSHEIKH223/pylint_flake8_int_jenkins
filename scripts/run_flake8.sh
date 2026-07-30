```bash
#!/bin/bash

set -e

echo "======================================"
echo "Running Flake8 Code Quality Check"
echo "======================================"

# Run Flake8 against the application repository
flake8 . \
    --config=.flake8 \
    --output-file=flake8-report.txt

echo "======================================"
echo "Flake8 check completed successfully"
echo "Report: flake8-report.txt"
echo "======================================"
```
