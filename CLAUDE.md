# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a homework repository for **ML Zoomcamp 2025 - Module 1: Introduction**. The project analyzes a car fuel efficiency dataset using pandas and numpy to answer specific homework questions.

## Commands

### Environment Setup
```bash
# Activate conda environment (ml-zoomcamp)
export PATH="$HOME/miniconda3/bin:$PATH"
source $HOME/miniconda3/bin/activate ml-zoomcamp
```

### Running the Analysis
```bash
# Run complete homework analysis (downloads dataset if needed)
./run_homework.sh

# Run Python script directly
python homework_analysis.py

# Run Jupyter notebook (for interactive exploration)
jupyter notebook homework1.ipynb
```

## Architecture

### Core Components

**homework_analysis.py** (`homework_analysis.py:1-116`)
- Complete standalone Python solution with all homework questions (Q1-Q7)
- Reads `car_fuel_efficiency.csv` dataset
- Outputs structured answers to console
- Key operations:
  - Data loading and exploration (Q1-Q4)
  - Filtering and aggregation (Q5)
  - Missing value imputation (Q6)
  - Linear algebra operations with NumPy (Q7: matrix multiplication, inversion, dot products)

**homework1.ipynb**
- Jupyter notebook with identical analysis broken into cells
- Includes cell outputs showing results
- Useful for interactive exploration and verification

**run_homework.sh**
- Bash script that activates conda environment, downloads dataset if missing, and runs analysis
- Entry point for executing the complete workflow

### Dataset

**car_fuel_efficiency.csv** (9,704 records, 11 columns)
- URL: https://raw.githubusercontent.com/alexeygrigorev/datasets/master/car_fuel_efficiency.csv
- Columns: engine_displacement, num_cylinders, horsepower, vehicle_weight, acceleration, model_year, origin, fuel_type, drivetrain, num_doors, fuel_efficiency_mpg
- Contains missing values in 4 columns (num_cylinders, horsepower, acceleration, num_doors)
- Origins: Asia, USA, Europe
- Fuel types: Gasoline, Diesel

## Key Implementation Details

### Q7 Matrix Calculation
The most complex operation in this codebase involves:
1. Filtering Asian cars and selecting first 7 clean rows (no NaN values)
2. Creating matrix X from vehicle_weight and model_year columns
3. Computing X^T × X (matrix multiplication)
4. Inverting the resulting matrix
5. Computing w = (X^T × X)^(-1) × X^T × y
6. Summing all elements in result vector w

The implementation uses `dropna().head(7)` to ensure exactly 7 complete rows are used for calculations.

### Missing Value Handling
For Q6, missing horsepower values are filled with the mode (most frequent value: 152.0) using `fillna()`. The script calculates median before and after imputation to determine if it changed.