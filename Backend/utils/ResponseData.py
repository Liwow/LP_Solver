from flask import Flask, jsonify
import json
app = Flask(__name__)


class ResponseData:
    def __init__(self, code=None, data=None, message=None):
        self.code = code
        self.data = data
        self.message = message

    def json(self):
        return jsonify(self.__dict__)

    @staticmethod
    def success():
        return ResponseData(200, None, "success").json()

    @staticmethod
    def list_response(data):
        r = []
        for d in data:
            d_dict = {str(key): str(value) for key, value in d.__dict__.items()}
            r.append(d_dict)
        return ResponseData(200, r, "success").json()
