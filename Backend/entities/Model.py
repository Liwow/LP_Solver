from Backend.create_app import db


class Model(db.Model):
    __tablename__ = 'model'
    model_id = db.Column(db.Integer, primary_key=True)
    model_name = db.Column(db.String(50), nullable=False)
    model_url = db.Column()
    model_profile = db.Column(db.String(1000), nullable=False)

    def __init__(self, model_url, model_name=None, model_profile=None):
        self.model_name = model_name
        self.model_url = model_url
        self.model_profile = model_profile

    def __repr__(self):
        return f"<Model {self.model_name}>"
