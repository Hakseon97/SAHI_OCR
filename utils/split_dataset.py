import os
import shutil
import random
import argparse
from tqdm import tqdm

def split_dataset(source_dir, dest_dir, split_ratio=[0.8, 0.1, 0.1]):
    print("Starting dataset split process...")
    
    # 소스 디렉토리 내의 이미지와 라벨 파일 목록 가져오기
    image_files = [f for f in os.listdir(os.path.join(source_dir, 'images')) if f.endswith(('.jpg', '.png', '.jpeg'))]
    
    print(f"Found {len(image_files)} image files.")
    
    # 파일 목록 섞기
    random.shuffle(image_files)
    
    # 분할 지점 계산
    train_split = int(len(image_files) * split_ratio[0])
    val_split = train_split + int(len(image_files) * split_ratio[1])
    
    # 분할된 리스트
    train_files = image_files[:train_split]
    val_files = image_files[train_split:val_split]
    test_files = image_files[val_split:]
    
    print("Creating new directories...")
    # 새 디렉토리 생성
    for split in ['train', 'val', 'test']:
        for data_type in ['images', 'labels']:
            os.makedirs(os.path.join(dest_dir, split, data_type), exist_ok=True)
    
    # 파일 복사 함수
    def copy_files(file_list, split):
        for file in tqdm(file_list, desc=f"Copying {split} files", unit="file"):
            # 이미지 복사
            src_image = os.path.join(source_dir, 'images', file)
            dst_image = os.path.join(dest_dir, split, 'images', file)
            shutil.copy(src_image, dst_image)
            
            # 라벨 복사 (파일 확장자만 변경)
            label_file = os.path.splitext(file)[0] + '.txt'
            src_label = os.path.join(source_dir, 'labels', label_file)
            dst_label = os.path.join(dest_dir, split, 'labels', label_file)
            shutil.copy(src_label, dst_label)
    
    print("Copying files...")
    # 파일 복사 실행
    copy_files(train_files, 'train')
    copy_files(val_files, 'val')
    copy_files(test_files, 'test')
    
    print(f"Dataset split complete. Train: {len(train_files)}, Val: {len(val_files)}, Test: {len(test_files)}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Split dataset into train, validation, and test sets.")
    parser.add_argument("source_dir", help="Path to the source directory containing 'images' and 'labels' folders")
    parser.add_argument("dest_dir", help="Path to the destination directory for the split dataset")
    parser.add_argument("--train", type=float, default=0.8, help="Proportion of the dataset to use for training (default: 0.8)")
    parser.add_argument("--val", type=float, default=0.1, help="Proportion of the dataset to use for validation (default: 0.1)")
    parser.add_argument("--test", type=float, default=0.1, help="Proportion of the dataset to use for testing (default: 0.1)")

    args = parser.parse_args()

    # 비율의 합이 1인지 확인
    if args.train + args.val + args.test != 1.0:
        raise ValueError("The sum of train, val, and test proportions must be 1.0")

    print("Dataset split script started.")
    print(f"Source directory: {args.source_dir}")
    print(f"Destination directory: {args.dest_dir}")
    print(f"Split ratios - Train: {args.train}, Val: {args.val}, Test: {args.test}")

    split_dataset(args.source_dir, args.dest_dir, [args.train, args.val, args.test])

    print("Dataset split script completed successfully.")