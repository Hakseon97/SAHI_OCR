# PowerShell script to create YOLOv8 for SAHI project structure

# Create root directory
$rootDir = "yolov8_for_sahi"
New-Item -ItemType Directory -Force -Path $rootDir

# Create subdirectories
$dirs = @(
    "data/dataset/images/train",
    "data/dataset/images/val",
    "data/dataset/images/test",
    "data/dataset/labels/train",
    "data/dataset/labels/val",
    "data/dataset/labels/test",
    "configs",
    "models",
    "scripts/utils",
    "notebooks",
    "runs/detect",
    "runs/train",
    "runs/val",
    "runs/predict"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path "$rootDir/$dir"
}

# Create empty files
$files = @(
    "configs/yolov8_config.yaml",
    "models/yolov8n.pt",
    "models/custom_model.pt",
    "scripts/train.py",
    "scripts/val.py",
    "scripts/predict.py",
    "scripts/export.py",
    "scripts/utils/dataloader.py",
    "scripts/utils/augmentations.py",
    "notebooks/data_exploration.ipynb",
    "notebooks/model_analysis.ipynb",
    "requirements.txt",
    "README.md",
    ".gitignore"
)

foreach ($file in $files) {
    New-Item -ItemType File -Force -Path "$rootDir/$file"
}

Write-Host "YOLOv8 for SAHI project structure has been created successfully!"
