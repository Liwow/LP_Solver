from Backend.create_app import db


class ModelBag(db.Model):
    __tablename__ = 'model_bag'
    model_bag_id = db.Column(db.Integer, primary_key=True)
    model_id = db.Column(db.String(50), nullable=False)
    user_id = db.Column(db.String(50), nullable=False)

    def __init__(self, model_bag_id, model_id, user_id):
        self.model_bag_id = model_bag_id
        self.model_id = model_id
        self.user_id = user_id

    def __repr__(self):
        return f"<ModelBag {self.model_bag_id}>"
