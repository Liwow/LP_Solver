from dns.resolver import Answer
from sqlalchemy import func

from Backend.create_app import db
from Backend.entities.AnswerRecord import AnswerRecord


class AnswerRecordDao:
    @staticmethod
    def create_answer_record(user_id, answer_time, accuracy):
        new_answer_record = AnswerRecord(user_id=user_id, answer_time=answer_time, accuracy=accuracy)
        db.session.add(new_answer_record)
        db.session.commit()
        return new_answer_record

    @staticmethod
    def get_answer_record_by_user_id(user_id):
        answer_record = AnswerRecord.query.filter_by(user_id=user_id).all()
        return answer_record

    @staticmethod
    def delete_answer_record(answer_id):
        answer_record = AnswerRecord.query.get(answer_id)
        db.session.delete(answer_record)
        db.session.commit()

    @staticmethod
    def get_all_answer_record():
        return AnswerRecord.query.all()

    def get_answer_count_by_user_id(self, user_id):
        count = db.session.query(func.count()). \
            filter(AnswerRecord.user_id == user_id). \
            scalar()
        return count
