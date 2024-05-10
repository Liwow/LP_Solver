from Backend.create_app import db
from Backend.entities.AdminAuthority import AdminAuthority


class AdminAuthorityDao:
    @staticmethod
    def create_admin_authority(admin_id, authority_id):
        new_admin_authority = AdminAuthority(admin_id=admin_id, authority_id=authority_id)

        db.session.add(new_admin_authority)
        db.session.commit()

        return new_admin_authority

    @staticmethod
    def get_admin_authority_list_by_admin_id(admin_id):
        admin_authority = AdminAuthority.query.filter_by(admin_id=admin_id).all()
        return admin_authority

    @staticmethod
    def get_admin_authority_list_by_authority_id(authority_id):
        admin_authority = AdminAuthority.query.get(authority_id)
        return admin_authority

    @staticmethod
    def delete_admin_authority(admin_id, authority_id):
        admin_authority = AdminAuthority(admin_id=admin_id, authority_id=authority_id)
        db.session.delete(admin_authority)
        db.session.commit()
