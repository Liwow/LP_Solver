from flask import json, Response, Flask

from Backend.create_app import create_app
from Backend.daos.UserDao import UserDao
from Backend.daos.AnswerRecordDao import AnswerRecordDao

class UserService:
    def __init__(self):
        self.user_dao = UserDao()
        self.answer_dao = AnswerRecordDao()

    def create_user(self, user_name, user_profile):
        new_user = self.user_dao.create_user(user_name, user_profile)
        return new_user

    def create_user_account(self, user_account):
        new_user = self.user_dao.create_user_account(user_account)
        return new_user

    def get_user_by_id(self, user_id):
        user = self.user_dao.get_user_by_id(user_id)
        return user

    def update_user(self, user_account, user_name, user_profile):
        self.user_dao.update_user(user_account, user_name, user_profile)

    def delete_user_by_account(self, user_account):
        self.user_dao.delete_user_by_account(user_account)

    def get_user_by_account(self, user_account):
        user = self.user_dao.get_user_by_account(user_account)
        return user

    def get_all_user(self):
        return self.user_dao.get_all_user()

    def update_user_point_by_account(self, user_account, point, type):
        user_point = self.user_dao.get_user_point_by_account(user_account)
        if type == 0:
            self.user_dao.update_user_point_by_account(user_account, user_point + int(point))
        else:
            self.user_dao.update_user_point_by_account(user_account, user_point - int(point))

    def get_answer_count_by_user_id(self, user_id):
        answer_count = self.answer_dao.get_answer_count_by_user_id(user_id)
        return answer_count

    def get_comment_count_by_user_id(self, user_id):
        # comment_count = self.answer_dao.get_comment_count_by_user_id(user_id)
        comment_count=15
        return comment_count

    def get_comment_like_num_by_user_id(self, user_id):
        # comment_like_num = self.answer_dao.get_comment_like_num_by_user_id(user_id)
        comment_like_num=96
        return comment_like_num
