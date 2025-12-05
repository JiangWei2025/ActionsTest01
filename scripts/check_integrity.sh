#!/bin/bash

echo "Checking required files..."

# Check for Program001.txt
if [ ! -f "Program001.txt" ]; then
    echo "Error: Program001.txt is missing!"
    exit 1
fi

# Check for branchReadme.txt
if [ ! -f "branchReadme.txt" ]; then
    echo "Error: branchReadme.txt is missing!"
    exit 1
fi

echo "All required files are present."
exit 0
