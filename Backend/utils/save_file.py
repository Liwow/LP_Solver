import os
import uuid

from Backend.create_app import create_app
from config import Config


def save_file(file, file_type, file_class):
    relative_folder = os.path.join(Config.STATIC_PATH, file_type, file_class)
    try:
        if hasattr(file, 'filename'):
            file_ext = file.filename.split('.')[-1]
            file_name = str(uuid.uuid4()) + '.' + file_ext

            absolute_folder = os.path.join(Config.ROOT_PATH, Config.BACKEND_PATH, relative_folder)
            relative_file = os.path.join(relative_folder, file_name)
            absolute_file = os.path.join(absolute_folder, file_name)
            # 创建目录（如果不存在）
            os.makedirs(absolute_folder, exist_ok=True)

            # 保存文件到 static 文件夹
            with open(absolute_file, "wb") as new_file:  # 使用with语句打开文件
                new_file.write(file.read())  # 向文件中写入一行文本

            print("文件保存成功: ", relative_file)
            return absolute_file, relative_file

    except Exception as e:
        # file_name = file.__str__()
        # absolute_folder = os.path.join(Config.ROOT_PATH, Config.BACKEND_PATH, relative_folder)
        # relative_file = os.path.join(relative_folder, file_name)
        # absolute_file = os.path.join(absolute_folder, file_name)
        # # 创建目录（如果不存在）
        # os.makedirs(absolute_folder, exist_ok=True)
        # file.save(absolute_file)
        print("文件保存失败: ", e)
        return None, None
