from Backend.create_app import db


class AdminAuthority(db.Model):
    __tablename__ = 'gcs_admin_authority'
    admin_authority_id = db.Column(db.Integer, primary_key=True)
    admin_id = db.Column(db.Integer, nullable=False)
    authority_id = db.Column(db.Integer, nullable=False)

    def __init__(self, admin_id, authority_id):
        self.admin_id = admin_id
        self.authority_id = authority_id

    def __repr__(self):
        return f"<AdminAuthority {self.admin_authority_id}>"
