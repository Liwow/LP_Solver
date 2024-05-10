from Backend.daos.ModelBagDao import ModelBagDao


class ModelBagService:
    def __init__(self):
        self.model_bag_dao = ModelBagDao()
