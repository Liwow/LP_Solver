import base64
import urllib

import requests
from bs4 import BeautifulSoup

API_KEY = "js2Hex1YtPKWtgGwhNw4GBH2"
SECRET_KEY = "SP9QHVTaG9avFaONFvuqF7n4wGYMKTaA"


# no vpn

def api(path):
    url = "https://aip.baidubce.com/rest/2.0/image-classify/v2/advanced_general?access_token=" + get_access_token()

    image = get_file_content_as_base64(path, True)
    payload = f'image={image}'
    headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': 'application/json'
    }

    response = requests.request("POST", url, headers=headers, data=payload)
    filtered_results = []
    result_json = response.json()
    for result in result_json["result"]:
        if result["score"] > 0.1:
            filtered_results.append(result)

    # 提取关键字、分数和根保存到变量中
    keywords = []
    scores = []
    roots = []
    for result in filtered_results:
        keywords.append(result["keyword"])
        scores.append(result["score"])
        roots.append(result["root"])

    result_json = response.json()

    return result_json, keywords, scores, roots


def get_file_content_as_base64(path, urlencoded=False):
    """
    获取文件base64编码
    :param path: 文件路径
    :param urlencoded: 是否对结果进行urlencoded
    :return: base64编码信息
    """
    with open(path, "rb") as f:
        content = base64.b64encode(f.read()).decode("utf8")
        if urlencoded:
            content = urllib.parse.quote_plus(content)
    return content


def get_access_token():
    """
    使用 AK，SK 生成鉴权签名（Access Token）
    :return: access_token，或是None(如果错误)
    """
    url = "https://aip.baidubce.com/oauth/2.0/token"
    params = {"grant_type": "client_credentials", "client_id": API_KEY, "client_secret": SECRET_KEY}
    return str(requests.post(url, params=params).json().get("access_token"))


def get_specific_content(url):
    response = requests.get(url)  # 发送 GET 请求获取网页内容
    soup = BeautifulSoup(response.text, 'html.parser')  # 使用 BeautifulSoup 解析 HTML

    # 在 HTML 中查找目标内容
    target_element = soup.find('div',
                               style='width:fit-content; display:inline-block;border: 1.3px dashed #3c85ee;border-radius: 8px;padding:0px 20px;')
    if target_element is not None:
        content = target_element.get_text().strip()
        return content

    return None


def classify(url):
    res = []
    _, keywords, scores, _ = api(url)
    if len(keywords) == 0:
        print('我识别不出来')
    else:
        for i in range(min(3, len(keywords))):
            key = keywords[i]
            score = scores[i]
            classification = get_specific_content(f"https://lajifenleiapp.com/sk/{key}?l=%E9%87%8D%E5%BA%86")
            # 截取“属于”后面的内容
            if classification.find("不明类型，换种名称试试看") != -1:
                classification = "不是垃圾"
            if classification.find('属于') != -1:
                classification = classification[classification.find('属于') + 2:].strip()
            r = {'garbage_name': key, 'garbage_classification': classification, 'probability': score}
            print(r)
            res.append(r)
    return res


if __name__ == '__main__':
    # 图片路径，自己改下
    path = "D:\\pythonProject\\GCSServer\\Model\\Data\\train\\87\\0cfe63a8ada1_1265.jpg"
    # 返回json, 置信度大于0.6 的 物体名列表,置信度列表, 所属物体类别列表
    res_json, keywords, scores, roots = api(path)
    if len(keywords) == 0:
        print('我识别不出来')
    else:
        print(f'物体为：{keywords[0]}')
        print(f'置信度为：{scores[0]}')
        key = keywords[0]
        url = f"https://lajifenleiapp.com/sk/{key}?l=%E9%87%8D%E5%BA%86"
        # 垃圾种类
        specific_content = get_specific_content(url)
        print(specific_content)
