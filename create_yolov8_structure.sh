#!/bin/bash

# Bash script to create YOLOv8 for SAHI project structure

# Create root directory
rootDir="yolov8_for_sahi"

# Function to create directories
create_directory() {
    mkdir -p "$1"
}

# Function to create multiple directories
create_directories() {
    local base_path="$1"
    shift
    for dir in "$@"; do
        create_directory "${base_path}/${dir}"
    done
}

# Main directory structure
mainDirs=(
    "configs" "data" "models" "notebook" "runs" "scripts" "utils"
)

# Create main directories
create_directories "$baseDir" "${mainDirs[@]}"

# Data subdirectories
dataDirs=(
    "demo"
    "note/test/images" "note/test/labels"
    "note/train/images" "note/train/labels"
    "note/val/images" "note/val/labels"
    "rawdata/images" "rawdata/labels"
)

# Create data subdirectories
create_directories "${baseDir}/data" "${dataDirs[@]}"

# Runs subdirectories
runsDirs=(
    "detect/train/weights"
    "detect/train2/weights"
    "train/yolo_training_test/weights"
)

# Create runs subdirectories
create_directories "${baseDir}/runs" "${runsDirs[@]}"

echo "Directory structure created successfully."
