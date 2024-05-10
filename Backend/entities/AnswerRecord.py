from Backend.create_app import db


class AnswerRecord(db.Model):
    __tablename__ = 'gcs_ans_record'
    answer_id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, nullable=False)
    answer_time = db.Column(db.Integer, nullable=False)
    answer_date = db.Column(db.DateTime, nullable=False, default=db.func.current_timestamp())
    accuracy = db.Column(db.Integer, nullable=False)

    def __init__(self, user_id, answer_time, accuracy):
        self.user_id = user_id
        self.answer_time = answer_time
        self.accuracy = accuracy

    def __repr__(self):
        return f"<AnswerRecord {self.answer_id}>"
