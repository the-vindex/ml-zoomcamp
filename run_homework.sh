#!/bin/bash

# ML Zoomcamp 2025 - Homework 1 Runner Script

echo "=== ML Zoomcamp 2025 - Homework 1 ===="
echo

# Activate conda environment
export PATH="$HOME/miniconda3/bin:$PATH"
source $HOME/miniconda3/bin/activate ml-zoomcamp

echo "Environment activated: ml-zoomcamp"
echo "Python version: $(python --version)"
echo "Pandas version: $(python -c 'import pandas as pd; print(pd.__version__)')"
echo

# Check if dataset exists
if [ ! -f "car_fuel_efficiency.csv" ]; then
    echo "Downloading dataset..."
    wget https://raw.githubusercontent.com/alexeygrigorev/datasets/master/car_fuel_efficiency.csv
    echo
fi

# Run the homework analysis
echo "Running homework analysis..."
python homework_analysis.py

echo
echo "=== Homework Complete ==="
echo "Check homework_answers.md for summary of results"