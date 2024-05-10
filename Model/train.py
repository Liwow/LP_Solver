import os

import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
from torch.utils.data import DataLoader, Subset
from torchvision.datasets import ImageFolder
# 数据集路径
from tqdm import tqdm

from config import Config

data_dir = os.path.join(Config.ROOT_PATH, "Model", "Data", "train")

# 定义预处理和数据增强
preprocess = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
])

# 加载数据集
dataset = ImageFolder(data_dir, transform=preprocess)
train_loader = DataLoader(dataset, batch_size=32, shuffle=True)

# dataset = ImageFolder(data_dir, transform=preprocess)
# need = list(range(0, len(dataset), 5))
# trainset = torch.utils.data.Subset(dataset, need)
# train_loader = torch.utils.data.DataLoader(trainset, batch_size=32, shuffle=True)



# 加载预训练的ResNeXt模型
model = torch.hub.load('pytorch/vision:v0.10.0', 'resnext50_32x4d', pretrained=True)

# 替换分类器层
num_classes = len(dataset.classes)
model.fc = nn.Linear(model.fc.in_features, num_classes)

# 定义损失函数和优化器
criterion = nn.CrossEntropyLoss()
# optimizer = optim.SGD(model.parameters(), lr=0.001, momentum=0.9)
optimizer = optim.SGD(model.parameters(), lr=0.01, momentum=0.9)

# 开始微调训练
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)

num_epochs = 6

for epoch in range(num_epochs):
    running_loss = 0.0
    with tqdm(train_loader, unit="batch") as t:
        for images, labels in t:
            images = images.to(device)
            labels = labels.to(device)

            optimizer.zero_grad()

            outputs = model(images)
            loss = criterion(outputs, labels)

            loss.backward()
            optimizer.step()

            running_loss += loss.item()
            t.set_postfix(loss=loss.item())

    # 计算并打印平均损失
    epoch_loss = running_loss / len(train_loader)
    print(f"Epoch [{epoch + 1}/{num_epochs}], Loss: {epoch_loss:.4f}")

    # 保存微调后的模型
    torch.save(model.state_dict(), f"resnext/epoch_{epoch}_{epoch_loss:.4f}.pth")
