from Backend.create_app import db
from Backend.entities.ModelBag import ModelBag

class ModelBagDao:
    @staticmethod
    def create_model_bag(model_bag_id, model_id, user_id):
        new_model_bag = ModelBag(model_bag_id, model_id, user_id)
        db.session.add(new_model_bag)
        db.session.commit()

    @staticmethod
    def get_model_bag_by_id(model_bag_id):
        model_bag = ModelBag.query.filter_by(model_bag_id=model_bag_id).first()
        return model_bag

    @staticmethod
    def get_model_by_userid(user_id):
        model_bag = ModelBag.query.filter_by(user_id=user_id)
        return model_bag

    @staticmethod
    def delete_model_bag_by_id(model_bag_id):
        model_bag = ModelBag.query.get(model_bag_id)
        db.session.delete(model_bag)
        db.session.commit()

    @staticmethod
    def get_all_model_bag():
        return ModelBag.query.all()


