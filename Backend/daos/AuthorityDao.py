from Backend.create_app import db
from Backend.entities.Authority import Authority


class AuthorityDao:
    @staticmethod
    def create_authority(authority_name, authority_desc):
        new_authority = Authority(authority_name=authority_name, authority_desc=authority_desc)
        db.session.add(new_authority)
        db.session.commit()
        return new_authority

    @staticmethod
    def get_authority_by_id(authority_id):
        authority = Authority.query.get(authority_id)
        return authority

    @staticmethod
    def update_authority(authority_id, authority_name, authority_desc):
        authority=Authority.query.get(authority_id)
        if authority:
            authority.authority_name = authority_name
            authority.authority = authority_desc
        db.session.commit()

    @staticmethod
    def delete_authority_by_id(authority_id):
        authority = Authority.query.get(authority_id)
        db.session.delete(authority)
        db.session.commit()

    @staticmethod
    def get_all_authority():
        return Authority.query.all()
