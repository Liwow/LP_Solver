# -*- coding: utf-8 -*-
import os.path

import torch
import torchvision
import torchvision.transforms as transforms
from PIL import Image

from config import Config


# url, filename = ("https://github.com/pytorch/hub/raw/master/images/dog.jpg", "dog.jpg")
# try: urllib.URLopener().retrieve(url, filename)
# except: urllib.request.urlretrieve(url, filename)
def classify(url=None, model=torch.hub.load('pytorch/vision:v0.10.0', 'resnext50_32x4d')):
    # 标签列表"/Model/Data/imagenet_classes.txt"
    model.eval()
    label_file = os.path.join(Config.ROOT_PATH, "Model", "Data", "train", "classname.txt")
    with open(label_file, "r", encoding="utf-8") as f:
        label_list = f.read().splitlines()

    # sample execution (requires torchvision)
    filename = url
    input_image = Image.open(filename)
    # 把图片转换为jpg格式
    if input_image.format != "JPEG":
        input_image = input_image.convert("RGB")

    preprocess = transforms.Compose([
        transforms.Resize(256),
        transforms.CenterCrop(224),
        transforms.ToTensor(),
        transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
    ])
    input_tensor = preprocess(input_image)
    input_batch = input_tensor.unsqueeze(0)  # create a mini-batch as expected by the model

    # move the input and model to GPU for speed if available
    if torch.cuda.is_available():
        input_batch = input_batch.to('cuda')
        model.to('cuda')

    with torch.no_grad():
        output = model(input_batch)
    # Tensor of shape 1000, with confidence scores over Imagenet's 1000 classes
    # print(output[0])
    # The output has unnormalized scores. To get probabilities, you can run a softmax on it.
    probabilities = torch.nn.functional.softmax(output[0], dim=0)
    sorted_idx = torch.argsort(probabilities, descending=True)
    # 取前三个，返回label和概率
    result = []
    for i in range(3):
        predicted_idx = sorted_idx[i]
        predicted_label = label_list[predicted_idx]
        p = probabilities[predicted_idx.item()].item()
        result.append((predicted_label, p))
    print("预测结果为：", result)
    return result


if __name__ == '__main__':
    url = "C:\\Users\\30838\\My\\Code\\Python\\GCSServer\\Model\\Data\\train2\\100\\0c9606b80d0d_1043.jpg"
    model = torchvision.models.resnext50_32x4d(pretrained=True)

    model.fc = torch.nn.Linear(2048, 265)
    model.load_state_dict(torch.load("resnext/7_12.pth"))
    classify(url, model)
