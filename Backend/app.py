from flask import make_response
from flask_cors import CORS

from Backend.create_app import create_app

app = create_app()
CORS(app, supports_credentials=True, resources=r'/*')


# 其他初始化和配置代码
# ...
@app.after_request
def func_res(resp):
    res = make_response(resp)
    res.headers['Access-Control-Allow-Origin'] = '*'
    res.headers['Access-Control-Allow-Methods'] = 'GET,POST'
    res.headers['Access-Control-Allow-Headers'] = 'x-requested-with,content-type'
    return res


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

