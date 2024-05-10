from Backend.daos.AdminAuthorityDao import AdminAuthorityDao
from Backend.daos.AdminDao import AdminDao
from Backend.daos.AuthorityDao import AuthorityDao


class AdminService:
    def __init__(self):
        self.authority_dao = AuthorityDao()
        self.admin_dao = AdminDao()
        self.admin_authority_dao = AdminAuthorityDao()

    def login(self, admin_account, admin_password):
        admin = self.admin_dao.get_admin_by_account(admin_account)
        if admin.admin_password == admin_password:
            return True
        else:
            return False

    def create_admin(self, admin_account, admin_password, admin_name=None, admin_profile=None):
        new_admin = self.admin_dao.create_admin(admin_account, admin_password, admin_name, admin_profile)
        return new_admin

    def get_admin_by_account(self, account):
        admin = self.admin_dao.get_admin_by_account(account)
        return admin

    def update_admin(self, admin_account, admin_password, admin_name=None, admin_profile=None):
        self.admin_dao.update_admin(admin_account, admin_password, admin_name, admin_profile)

    def delete_admin(self, admin_account):
        self.admin_dao.delete_admin(admin_account)

    def delete_admin_by_id(self, admin_id):
        self.admin_dao.delete_admin_by_id(admin_id)

    def get_all_admin(self):
        return self.admin_dao.get_all_admin()

    def addAuthority(self, authority_name, authority_desc):
        self.authority_dao.create_authority(authority_name, authority_desc)

    def deleteAuthority(self, authority_id):
        self.authority_dao.delete_authority_by_id(authority_id)

    def add_admin_authority(self, admin_account, authority_id):
        admin = self.admin_dao.get_admin_by_account(admin_account)
        authority = self.authority_dao.get_authority_by_id(authority_id)
        self.admin_authority_dao.create_admin_authority(admin, authority)

    def delete_admin_authority(self, admin_account, authority_id):
        admin = self.admin_dao.get_admin_by_account(admin_account)
        authority = self.authority_dao.get_authority_by_id(authority_id)
        self.admin_authority_dao.delete_admin_authority(admin, authority)

    def get_authority_list_by_admin(self, admin_id):
        return self.admin_authority_dao.get_admin_authority_list_by_admin_id(admin_id)

    def get_admin_list_by_authority(self, authority_id):
        authority = self.authority_dao.get_authority_by_id(authority_id)
        return self.admin_authority_dao.get_admin_authority_list_by_authority_id(authority.authority_id)

    def hasAuthority_by_id(self, admin_id, authority_id):
        authority_list = self.get_authority_list_by_admin(admin_id)
        for authority in authority_list:
            if authority.authority_id == authority_id:
                return True
        return False
