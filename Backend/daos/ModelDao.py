from Backend.create_app import db
from Backend.entities.Model import Model

class ModelDao:
    @staticmethod
    def create_model(model_url, model_name=None, model_profile=None):
        new_model = Model(model_url=model_url, model_name=model_name, model_profile=model_profile)
        db.session.add(new_model)
        db.session.commit()

    @staticmethod
    def get_model_by_url(model_url):
        model = Model.query.filter_by(model_url=model_url).first()
        return model

    @staticmethod
    def update_model(model_url=None, model_name=None, model_profile=None):
        model = Model.query.filter_by(model_url)
        if model:
            model.model_url = model_url
            model.model_name = model_name
            model.model_profile = model_profile
        db.session.commit()

    @staticmethod
    def delete_model(model_url):
        model = Model.query.filter_by(model_url)
        db.session.delete(model)
        db.session.commit()

    @staticmethod
    def get_all_model():
        return Model.query.all()

    @staticmethod
    def get_model_by_id(model_id):
        return Model.query.get(model_id)

    @staticmethod
    def delete_model_by_id(model_id):
        model = Model.query.get(model_id)
        db.session.delete(model)
        db.session.commit()

    @staticmethod
    def get_model_by_name(model_name):
        return Model.query.filter_by(model_name=model_name).first()
