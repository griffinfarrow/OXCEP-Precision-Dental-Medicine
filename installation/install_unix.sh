#!/bin/bash

ENV_NAME="precision-course-env"
ENV_FILE="environment.yml"

echo "========================================"
echo "Setting up course environment from $ENV_FILE"
echo "========================================"
if [ ! -f $ENV_FILE ]; then
    echo "ERROR: $ENV_NAME  not found in current directory."
    exit 1
fi

# Conda activation support
source "$(conda info --base)/etc/profile.d/conda.sh"

# Delete environment if already exists 
if conda info --envs | grep -q "^$ENV_NAME\s"; then
    echo "Environment '$ENV_NAME' exists. Removing it..."
    conda env remove -n $ENV_NAME -y
fi

# Create environment
conda env create -f $ENV_FILE -y


echo " "
echo "========================================"
echo "Environment created."
echo "========================================"
echo " "

echo "========================================"
echo "Testing whether environment has been correctly created."
echo "========================================"
conda activate $ENV_NAME
python verify_installation.py
