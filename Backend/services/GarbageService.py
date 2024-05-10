from Backend.daos.GarbageDao import GarbageDao


class GarbageService:
    def __init__(self):
        self.garbage_dao = GarbageDao()

    def create_garbage(self, garbage_name, garbage_classification):
        new_garbage = self.garbage_dao.create_garbage(garbage_name, garbage_classification)
        return new_garbage

    def get_garbage_by_id(self, garbage_id):
        garbage = self.garbage_dao.get_garbage_by_id(garbage_id)
        return garbage

    def update_garbage(self, garbage_id, garbage_name, garbage_classification):
        self.garbage_dao.update_garbage(garbage_id, garbage_name, garbage_classification)

    def delete_garbage_by_id(self, garbage_id):
        self.garbage_dao.delete_garbage_by_id(garbage_id)

    def delete_garbage_by_name(self, garbage_name):
        self.garbage_dao.delete_garbage_by_name(garbage_name)

    def get_garbage_by_classification(self, classification):
        garbage_list = self.garbage_dao.get_garbage_by_classification(classification)
        return garbage_list

    def get_garbage_by_name(self, garbage_name):
        gs = self.garbage_dao.get_garbage_by_name(garbage_name)
        return gs

    def get_all_garbage(self):
        return self.garbage_dao.get_all_garbage()

    def get_garbage_by_name_fuzzy(self, garbage_name):
        garbage_list = self.garbage_dao.get_garbage_by_name_fuzzy(garbage_name)
        return garbage_list
