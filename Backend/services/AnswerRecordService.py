from Backend.daos.AnswerRecordDao import AnswerRecordDao


class AnswerRecordService:
    def __init__(self):
        self.answer_record_dao = AnswerRecordDao()

    def create_answer_record(self, user_id, answer_time, accuracy):
        return self.answer_record_dao.create_answer_record(user_id, answer_time, accuracy)

    def get_answer_record_by_user_id(self, user_id):
        return self.answer_record_dao.get_answer_record_by_user_id(user_id)

    def get_all_answer_record(self):
        return self.answer_record_dao.get_all_answer_record()

    def delete_answer_record(self, answer_id):
        return self.answer_record_dao.delete_answer_record(answer_id)
