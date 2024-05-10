from Backend.create_app import db


class User(db.Model):
    __tablename__ = 'user'
    user_id = db.Column(db.Integer, primary_key=True, comment='用户id')
    user_account = db.Column(db.String(50), nullable=False)
    user_password = db.Column(db.String(50), nullable=False)
    user_name = db.Column(db.String(50))
    user_profile = db.Column(db.String(1000))
    user_create_datetime = db.Column(db.DateTime, nullable=False, default=db.func.current_timestamp())
    user_status = db.Column(db.Integer, nullable=False, default=1)
    user_delete_timestamp = db.Column(db.DateTime)

    def __init__(self, user_account, user_password, user_name=None, user_profile=None):
        self.user_account = user_account
        self.user_password = user_password
        self.user_name = user_name
        self.admin_profile = user_profile

    def __repr__(self):
        return f"<User {self.user_name}>"
