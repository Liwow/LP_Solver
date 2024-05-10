from Backend.create_app import db


class Quiz(db.Model):
    __tablename__ = 'gcs_quiz'
    quiz_id = db.Column(db.Integer, primary_key=True)
    quiz_desc = db.Column(db.String(50), nullable=False)
    quiz_ans = db.Column(db.String(50), nullable=False)
    quiz_opt = db.Column(db.String(50), nullable=False)
    quiz_datetime = db.Column(db.DateTime, server_default=db.func.current_timestamp())
    quiz_status = db.Column(db.SmallInteger, default=1)
    quiz_delete_datetime = db.Column(db.DateTime, nullable=True)

    def __init__(self, quiz_desc, quiz_ans, quiz_opt):
        self.quiz_desc = quiz_desc
        self.quiz_ans = quiz_ans
        self.quiz_opt = quiz_opt

    def __repr__(self):
        return f"<Quiz {self.quiz}>"
