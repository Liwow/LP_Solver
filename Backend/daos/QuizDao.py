from random import sample

from Backend.create_app import db
from Backend.entities.Quiz import Quiz


class QuizDao:
    @staticmethod
    def create_quiz(quiz_desc, quiz_ans, quiz_opt):
        new_quiz = Quiz(quiz_desc=quiz_desc, quiz_ans=quiz_ans, quiz_opt=quiz_opt)

        db.session.add(new_quiz)
        db.session.commit()

        return new_quiz

    @staticmethod
    def get_quiz_by_id(quiz_id):
        quiz = Quiz.query.get(quiz_id)
        return quiz

    @staticmethod
    def get_all_quiz():
        quizzes = Quiz.query.all()
        return quizzes

    @staticmethod
    def update_quiz(quiz_id, quiz_desc, quiz_ans, quiz_opt):
        quiz = Quiz.query.get(quiz_id)
        if quiz:
            quiz.quiz_desc = quiz_desc
            quiz.quiz_ans = quiz_ans
            quiz.quiz_opt = quiz_opt
        db.session.commit()

    @staticmethod
    def delete_quiz_by_id(quiz_id):
        quiz = Quiz.query.get(quiz_id)
        db.session.delete(quiz)
        db.session.commit()

    @staticmethod
    def insert_quiz_data(quiz_data):
        for data in quiz_data:
            quiz = Quiz(
                quiz_desc=data['quiz_desc'],
                quiz_ans=data['quiz_ans'],
                quiz_opt=data['quiz_opt']
            )
            db.session.add(quiz)
        db.session.commit()
