from Backend.create_app import db


class Garbage(db.Model):
    __tablename__ = 'gcs_garbage'
    garbage_id = db.Column(db.Integer, primary_key=True)
    garbage_name = db.Column(db.String(50), nullable=False)
    garbage_classification = db.Column(db.Enum('可回收垃圾', '其他垃圾', '有害垃圾', '厨余垃圾'), nullable=False)

    def __init__(self, garbage_name, garbage_classification):
        self.garbage_name = garbage_name
        self.garbage_classification = garbage_classification

    def __repr__(self):
        return f"<Garbage {self.garbage_name}>"
