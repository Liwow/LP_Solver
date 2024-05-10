from Backend.create_app import db


class Admin(db.Model):
    __tablename__ = 'gcs_admin'
    admin_id = db.Column(db.Integer, primary_key=True, comment='管理员id')
    admin_account = db.Column(db.String(50), nullable=False)
    admin_password = db.Column(db.String(50), nullable=False)
    admin_name = db.Column(db.String(50))
    admin_profile = db.Column(db.String(1000))
    admin_create_datetime = db.Column(db.DateTime, nullable=False, default=db.func.current_timestamp())
    admin_status = db.Column(db.Integer, nullable=False, default=1)
    admin_delete_timestamp = db.Column(db.DateTime)

    def __init__(self, admin_account, admin_password, admin_name=None, admin_profile=None):
        self.admin_account = admin_account
        self.admin_password = admin_password
        self.admin_name = admin_name
        self.admin_profile = admin_profile

    def __repr__(self):
        return f"<Admin {self.admin_id}>"
