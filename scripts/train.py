from ultralytics import YOLO
import yaml

def main():
    # 설정 로드
    with open('configs/train_config.yaml', 'r') as file:
        train_config = yaml.safe_load(file)

    # 모델 초기화
    model = YOLO('models/yolov8s.pt')

    # 학습 실행
    results = model.train(data='configs/dataset.yaml', **train_config)

if __name__ == '__main__':
    main()
