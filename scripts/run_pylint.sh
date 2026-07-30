```bash
#!/bin/bash

set -e

echo "======================================"
echo "Running Pylint Code Quality Check"
echo "======================================"

# Run Pylint against Python files
pylint . \
    --rcfile=.pylintrc \
    --output=python-pylint-report.txt

echo "======================================"
echo "Pylint check completed successfully"
echo "Report: python-pylint-report.txt"
echo "======================================"
```
