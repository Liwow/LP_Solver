from random import sample

from Backend.daos.QuizDao import QuizDao
from Backend.daos.AnswerRecordDao import AnswerRecordDao
from Backend.daos.UserDao import UserDao
class QuizService:
    def __init__(self):
        self.quiz_dao = QuizDao()
        self.answer_record_dao = AnswerRecordDao()
        self.user_dao = UserDao()

    def get_random_quiz(self, num=10):
        quizzes = self.quiz_dao.get_all_quiz()
        random_quizzes = sample(quizzes, num)
        return random_quizzes

    def insert_answer_record(self,user_account, answer_time, accuracy):
        user_id=self.user_dao.get_user_id_by_account(user_account)
        answer_record=self.answer_record_dao.create_answer_record(user_id, answer_time, accuracy)
        return answer_record

    def add_quiz(self, quiz_desc, quiz_ans, quiz_opt):
        quiz = self.quiz_dao.create_quiz(quiz_desc, quiz_ans, quiz_opt)
        return quiz

    def get_quiz_by_id(self, quiz_id):
        quiz = self.quiz_dao.get_quiz_by_id(quiz_id)
        return quiz

    def get_all_quiz(self):
        quizzes = self.quiz_dao.get_all_quiz()
        return quizzes

    def update_quiz(self, quiz_id, quiz_desc, quiz_ans, quiz_opt):
        quiz = self.quiz_dao.update_quiz(quiz_id, quiz_desc, quiz_ans, quiz_opt)
        return quiz
    def get_all_answer_record(self):
        return self.answer_record_dao.get_all_answer_record()

    def get_answer_record_by_account(self,openid):
        user_id=self.user_dao.get_user_id_by_account(openid)
        answer_records=self.answer_record_dao.get_answer_record_by_user_id(user_id)
        answer_record_desc=[{'user_id': user_id, 'answer_time': answer_record.answer_time, 'accuracy': answer_record.accuracy, 'answer_data':answer_record.answer_date.strftime('%Y.%m.%d %H:%M:%S') } for answer_record in answer_records]
        return answer_record_desc


    def delete_quiz(self, quiz_id):
        self.quiz_dao.delete_quiz_by_id(quiz_id)

    def insert_quiz_data(self, quiz_data):
        self.quiz_dao.insert_quiz_data(quiz_data)

    def get_all_answer_record(self):
        return self.answer_record_dao.get_all_answer_record()