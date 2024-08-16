# Create root directory
$rootDir = "yolov8_for_sahi"

# Function to create directories
function Create-Directory {
    param (
        [string]$path
    )
    New-Item -Path $path -ItemType Directory -Force | Out-Null
}

# Function to create multiple directories
function Create-Directories {
    param (
        [string]$basePath,
        [string[]]$dirs
    )
    foreach ($dir in $dirs) {
        Create-Directory -path (Join-Path $basePath $dir)
    }
}

# Main directory structure
$mainDirs = @(
    "configs", "data", "models", "notebook", "runs", "scripts", "utils"
)

# Create main directories
Create-Directories -basePath $baseDir -dirs $mainDirs

# Data subdirectories
$dataDirs = @(
    "demo",
    "note\test\images", "note\test\labels",
    "note\train\images", "note\train\labels",
    "note\val\images", "note\val\labels",
    "rawdata\images", "rawdata\labels"
)

# Create data subdirectories
Create-Directories -basePath (Join-Path $baseDir "data") -dirs $dataDirs

# Runs subdirectories
$runsDirs = @(
    "detect\train\weights",
    "detect\train2\weights",
    "train\yolo_training_test\weights"
)

# Create runs subdirectories
Create-Directories -basePath (Join-Path $baseDir "runs") -dirs $runsDirs

Write-Host "Directory structure created successfully."