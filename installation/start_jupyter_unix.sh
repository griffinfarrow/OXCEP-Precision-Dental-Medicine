#!/bin/bash

source "$(conda info --base)/etc/profile.d/conda.sh" 
conda activate precision-course-env

if [ $? -ne 0 ]; then 
    echo "Failed to activate conda environment."
    exit 1
fi 

jupyter notebook --notebook-dir="../course_content/"
