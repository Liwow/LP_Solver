from Backend.create_app import db
from Backend.entities.Admin import Admin


class AdminDao:
    @staticmethod
    def create_admin(admin_account, admin_password, admin_name=None, admin_profile=None):
        new_admin = Admin(admin_account=admin_account, admin_password=admin_password,
                          admin_name=admin_name, admin_profile=admin_profile)

        db.session.add(new_admin)
        db.session.commit()

        return new_admin

    @staticmethod
    def get_admin_by_account(admin_account):
        admin = Admin.query.filter_by(admin_account=admin_account).first()
        return admin

    @staticmethod
    def update_admin(admin_account=None, admin_password=None, admin_name=None, admin_profile=None):
        admin = Admin.query.filter_by(admin_account)
        if admin:
            admin.admin_account = admin_account
            admin.admin_password = admin_password
            admin.admin_name = admin_name
            admin.admin_profile = admin_profile
        db.session.commit()

    @staticmethod
    def delete_admin(admin_account):
        admin = Admin.query.filter_by(admin_account)
        db.session.delete(admin)
        db.session.commit()

    @staticmethod
    def delete_admin_by_id(admin_id):
        admin = Admin.query.get(admin_id)
        db.session.delete(admin)
        db.session.commit()

    @staticmethod
    def get_all_admin():
        return Admin.query.all()

    @staticmethod
    def get_admin_by_id(admin_id):
        return Admin.query.get(admin_id)