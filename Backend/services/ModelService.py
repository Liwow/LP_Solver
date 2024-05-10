from Backend.daos.ModelDao import ModelDao


class ModelService:
    def __init__(self):
        self.model_dao = ModelDao()
