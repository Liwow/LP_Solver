from Backend.create_app import db
from Backend.entities.User import User


class UserDao:
    @staticmethod
    def create_user(user_account, user_password, user_name=None, user_profile=None):
        new_user = User(user_account=user_account, user_password=user_password,
                          user_name=user_name, user_profile=user_profile)

        db.session.add(new_user)
        db.session.commit()

        return new_user

    @staticmethod
    def get_user_by_account(user_account):
        user = User.query.filter_by(user_account=user_account).first()
        return user

    @staticmethod
    def update_user(user_account=None, user_password=None, user_name=None, user_profile=None):
        user = User.query.filter_by(user_account)
        if user:
            user.user_account = user_account
            user.user_password = user_password
            user.user_name = user_name
            user.user_profile = user_profile
        db.session.commit()

    @staticmethod
    def delete_user(user_account):
        user = User.query.filter_by(user_account)
        db.session.delete(user)
        db.session.commit()

    @staticmethod
    def delete_user_by_id(user_id):
        user = User.query.get(user_id)
        db.session.delete(user)
        db.session.commit()

    @staticmethod
    def get_all_user():
        return User.query.all()

    @staticmethod
    def get_user_by_id(user_id):
        return User.query.get(user_id)


