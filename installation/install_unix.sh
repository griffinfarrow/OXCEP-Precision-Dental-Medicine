#!/bin/bash

echo "Setting up course environment from environment.yml"

if [ ! -f environment.yml ]; then
    echo "ERROR: environment.yml not found in current directory."
    exit 1
fi

# Conda activation support
source "$(conda info --base)/etc/profile.d/conda.sh"

# Create environment
conda env create -f environment.yml

echo "Environment created."
echo "To activate it, run:"
echo "conda activate course-env"
