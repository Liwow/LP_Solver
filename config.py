class Config:
    DEBUG = False
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost:3306/gcs_db'
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SQLALCHEMY_COMMIT_TEARDOWN = True
    SECRET_KEY = 'root'
    ROOT_PATH = 'D:/pythonProject/LP_Solver'
    BACKEND_PATH = 'Backend'
    STATIC_PATH = 'static'
    HOST = '0.0.0.0'
    PORT = 8080
    APP_ID = 'wx6ed354e241bc25e7'
    APP_SECRET = 'c4de9cd7f0e1a5eb98498e73e6d8eff6'
    # 其他配置项...


class DevelopmentConfig(Config):
    DEBUG = True
    # 其他开发环境配置项...


class ProductionConfig(Config):
    DEBUG = False
    # 其他生产环境配置项...


# 根据需要，可以添加其他环境的配置类，比如测试环境

config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig
    # 添加其他环境配置类的映射
}
