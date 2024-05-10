from Backend.create_app import db


class Authority(db.Model):
    __tablename__ = 'gcs_authority'
    authority_id = db.Column(db.Integer, primary_key=True)
    authority_name = db.Column(db.String(50), nullable=False)
    authority_desc = db.Column(db.String(50, collation='utf8mb4_0900_ai_ci'), nullable=False, default='')

    def __init__(self, authority_name, authority_desc):
        self.authority_name = authority_name
        self.authority_desc = authority_desc

    def __repr__(self):
        return f"<Authority {self.authority_name}>"
