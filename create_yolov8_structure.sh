#!/bin/bash

# Bash script to create YOLOv8 for SAHI project structure

# Create root directory
rootDir="yolov8_for_sahi"
mkdir -p "$rootDir"

# Create subdirectories
dirs=(
    "data/dataset/images/train"
    "data/dataset/images/val"
    "data/dataset/images/test"
    "data/dataset/labels/train"
    "data/dataset/labels/val"
    "data/dataset/labels/test"
    "configs"
    "models"
    "scripts/utils"
    "notebooks"
    "runs/detect"
    "runs/train"
    "runs/val"
    "runs/predict"
)

for dir in "${dirs[@]}"; do
    mkdir -p "$rootDir/$dir"
done

# Create empty files
files=(
    "configs/yolov8_config.yaml"
    "models/yolov8n.pt"
    "models/custom_model.pt"
    "scripts/train.py"
    "scripts/val.py"
    "scripts/predict.py"
    "scripts/export.py"
    "scripts/utils/dataloader.py"
    "scripts/utils/augmentations.py"
    "notebooks/data_exploration.ipynb"
    "notebooks/model_analysis.ipynb"
    "requirements.txt"
    "README.md"
    ".gitignore"
)

for file in "${files[@]}"; do
    touch "$rootDir/$file"
done

echo "YOLOv8 for SAHI project structure has been created successfully!"
