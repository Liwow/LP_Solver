from Backend.create_app import db
from Backend.entities.Garbage import Garbage


class GarbageDao:
    @staticmethod
    def create_garbage(garbage_name, garbage_classification):
        new_garbage = Garbage(garbage_name=garbage_name, garbage_classification=garbage_classification)
        db.session.add(new_garbage)
        db.session.commit()
        return new_garbage

    @staticmethod
    def get_garbage_by_id(garbage_id):
        garbage = Garbage.query.get(garbage_id)
        return garbage

    @staticmethod
    def update_garbage(garbage_id, garbage_name, garbage_classification):
        garbage = Garbage.query.get(garbage_id)
        garbage.garbage_name = garbage_name
        garbage.garbage_classification = garbage_classification
        db.session.commit()

    @staticmethod
    def delete_garbage_by_id(garbage_id):
        garbage = Garbage.query.get(garbage_id)
        db.session.delete(garbage)
        db.session.commit()

    @staticmethod
    def delete_garbage_by_name(garbage_name):
        garbage = Garbage.query.filter_by(garbage_name).first()
        db.session.delete(garbage)
        db.session.commit()

    @staticmethod
    def get_garbage_by_classification(classification):
        garbage_list = Garbage.query.filter_by(garbage_classification=classification).all()
        return garbage_list

    @staticmethod
    def get_garbage_by_name(garbage_name):
        garbage = Garbage.query.filter_by(garbage_name=garbage_name).all()
        return garbage

    @staticmethod
    def get_all_garbage():
        return Garbage.query.all()

    @staticmethod
    def get_garbage_by_name_fuzzy(garbage_name):
        garbage_list = Garbage.query.filter(Garbage.garbage_name.like('%' + garbage_name + '%')).all()
        return garbage_list
