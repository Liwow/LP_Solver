from flask import Flask
from flask_sqlalchemy import SQLAlchemy

from config import config

db = SQLAlchemy()


def create_app():
    app = Flask(__name__, template_folder='templates', static_folder='static')
    app.config.from_object(config['development'])  # 指定使用开发环境的配置
    # 注册蓝图


    from Backend.controllers.AdminController import admin_bp

    app.register_blueprint(admin_bp, url_prefix='/')

    db.init_app(app)
    return app
