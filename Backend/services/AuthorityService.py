# from Backend.daos.AuthorityDao import AuthorityDao
#
#
# class AuthorityService:
#
#     def __init__(self):
#         self.authoritydao=AuthorityDao()
#
#     def get_all_authority(self):
#         return self.authoritydao.get_all_authority()
#
#     def create_authority(self, authority_name, authority_desc):
#         return self.authoritydao.create_authority(authority_name, authority_desc)
#
#     def get_authority_by_id(self, authority_id):
#         return self.authoritydao.get_authority_by_id(authority_id)
#
#     def update_authority(self, authority_id, authority_name, authority_desc):
#         self.authoritydao.update_authority(authority_id, authority_name, authority_desc)
#
#     def delete_authority_by_id(self, authority_id):
#         self.authoritydao.delete_authority_by_id(authority_id)
#
#     def get_authority_by_name(self, authority_name):
#         return self.authoritydao.get_authority_by_name(authority_name)
#
#     def get_authority_by_id_fuzzy(self, authority_id):
#         return self.authoritydao.get_authority_by_id_fuzzy(authority_id)