import threading

from flask import Blueprint, request, render_template, redirect, url_for, jsonify
import time
from Backend.daos.AdminAuthorityDao import AdminAuthorityDao
from Backend.daos.AuthorityDao import AuthorityDao
from Backend.services.AdminService import AdminService
from Backend.services.AnswerRecordService import AnswerRecordService
from Backend.services.GarbageService import GarbageService
from Backend.services.QuizService import QuizService
from Backend.services.UserService import UserService
from Backend.services.ModelService import ModelService
from Backend.services.ModelBagService import ModelBagService

admin_bp = Blueprint('admin', __name__)
admin_service = AdminService()
user_service = UserService()
garbage_service = GarbageService()
admin_authority_service = AdminAuthorityDao()
authority_service = AuthorityDao()
quiz_service = QuizService()
answer_record_service = AnswerRecordService()
model_service = ModelService()
model_bag_service = ModelBagService()
progress = 0

@admin_bp.route('/', methods=['GET', 'POST'])
@admin_bp.route('/index', methods=['GET', 'POST'])
def index():
    already_login = request.args.get('admin_account')
    admin_account = already_login if already_login else request.form.get('admin_account')
    admin_password = request.form.get('admin_password')
    error = request.args.get('error')
    if not admin_account:
        return redirect(url_for('admin.login', error=error))
    elif already_login or admin_service.login(admin_account, admin_password):
        return render_template('index.html', admin_account=admin_account)
    else:
        return redirect(url_for('admin.login', error="账号或密码错误"))


@admin_bp.route('/login')
def login():
    return render_template('login.html', error=request.args.get('error'))


@admin_bp.route('/solveProblem', methods=['GET'])
def solveProblem():
    admin_account = request.args.get('admin_account')
    solveWay = request.args.get('solveWay')
    insType = 'file'
    if request.args.get('Para_C') is not "":
        print(request.args.get('Para_C') is "")
        Para_C = request.args.get('Para_C')
        Para_A = request.args.get('Para_A')
        Para_b = request.args.get('Para_b')
        Para_Aeq = request.args.get('Para_Aeq')
        Para_beq = request.args.get('Para_beq')
        instance = [Para_C, Para_A, Para_b, Para_Aeq, Para_beq]
        insType = 'num'
    else:
        instance = request
    if solveWay == "solving":
        global progress
        progress = 0  # 重置进度
        threading.Thread(target=simulate_long_task).start()  # 启动任务
        admin_account = request.args.get('admin_account')  # 假设这里是动态获取的
        return redirect(url_for('admin.solver_progress', admin_account=admin_account, insType=insType))
    else:
        return render_template('model_select.html', admin_account=admin_account, insType=insType)


@admin_bp.route('/manage_garbage/add/', methods=['GET'])
def select_model():
    admin_account = request.args.get('admin_account')
    admin_id = admin_service.get_admin_by_account(admin_account).admin_id
    if admin_service.hasAuthority_by_id(admin_id, 1) or admin_service.hasAuthority_by_id(admin_id, 2):
        garbage_name = request.args.get('garbage_name')
        garbage_classification = request.args.get('garbage_classification')
        insType = request.args.get('insType')
        global progress
        progress = 0  # 重置进度
        threading.Thread(target=simulate_long_task).start()  # 启动任务
        admin_account = request.args.get('admin_account')  # 假设这里是动态获取的
        return redirect(url_for('admin.solver_progress', admin_account=admin_account, insType=insType))
    else:
        return render_template('login.html', error="权限不足")


@admin_bp.route('/solve', methods=['GET'])
def solve():
    admin_account = request.args.get('admin_account')
    admin_id = admin_service.get_admin_by_account(admin_account).admin_id
    print('start')
    if admin_service.hasAuthority_by_id(admin_id, 1) or admin_service.hasAuthority_by_id(admin_id, 2):
        return render_template('solve.html', admin_account=admin_account)
    else:
        return render_template('login.html', error="权限不足")


@admin_bp.route('/result', methods=['GET'])
def result():
    admin_account = request.args.get('admin_account')
    return render_template('result.html', admin_account=admin_account)


@admin_bp.route('/manage_quiz', methods=['GET', 'POST'])
def manage_quiz():
    admin_account = request.args.get('admin_account')
    admin_id = admin_service.get_admin_by_account(admin_account).admin_id
    if admin_service.hasAuthority_by_id(admin_id, 1) or admin_service.hasAuthority_by_id(admin_id, 6):
        quizs = quiz_service.get_all_quiz()
        return render_template('manage_quiz.html', admin_account=request.args.get('admin_account'), quizs=quizs)
    else:
        return render_template('login.html', error="权限不足")


@admin_bp.route('/manage_quiz_add', methods=['GET'])
def manage_quiz_add():
    return render_template('manage_quiz_add.html', admin_account=request.args.get('admin_account'))


@admin_bp.route('/manage_quiz_update', methods=['GET'])
def manage_quiz_update():
    quiz_id = request.args.get('quiz_id')
    quiz = quiz_service.get_quiz_by_id(quiz_id)
    return render_template('manage_quiz_update.html', admin_account=request.args.get('admin_account'), quiz=quiz)


@admin_bp.route('/manage_quiz/update', methods=['GET', 'POST'])
def update_quiz():
    admin_account = request.args.get('admin_account')
    quiz_id = request.args.get('quiz_id')
    admin_id = admin_service.get_admin_by_account(admin_account).admin_id
    if admin_service.hasAuthority_by_id(admin_id, 1) or admin_service.hasAuthority_by_id(admin_id, 6):
        quiz_desc = request.args.get('quiz_desc')
        quiz_opt = request.args.get('quiz_opt')
        quiz_ans = request.args.get('quiz_ans')
        if quiz_desc is not None and quiz_opt is not None and quiz_ans is not None:
            try:
                quiz_service.update_quiz(quiz_id, quiz_desc, quiz_ans, quiz_opt)
            except Exception as e:
                print("error")
        quizs = quiz_service.get_all_quiz()
        return render_template('manage_quiz.html', admin_account=admin_account, quizs=quizs)
    else:
        return render_template('login.html', error="权限不足")


@admin_bp.route('/manage_quiz/add/', methods=['POST', 'GET'])
def add_quiz():
    admin_account = request.args.get('admin_account')
    admin_id = admin_service.get_admin_by_account(admin_account).admin_id
    if admin_service.hasAuthority_by_id(admin_id, 1) or admin_service.hasAuthority_by_id(admin_id, 6):
        quiz_desc = request.args.get('quiz_desc')
        quiz_opt = request.args.get('quiz_opt')
        quiz_ans = request.args.get('quiz_ans')
        if quiz_desc is not None and quiz_opt is not None and quiz_ans is not None:
            try:
                quiz_service.add_quiz(quiz_desc, quiz_ans, quiz_opt)
            except Exception as e:
                print("error")
        quizs = quiz_service.get_all_quiz()
        return render_template('manage_quiz.html', admin_account=admin_account, quizs=quizs)
    else:
        return render_template('login.html', error="权限不足")


@admin_bp.route('/manage_quiz/delete/', methods=['GET'])
def delete_quiz():
    admin_account = request.args.get('admin_account')
    admin_id = admin_service.get_admin_by_account(admin_account).admin_id
    if admin_service.hasAuthority_by_id(admin_id, 1) or admin_service.hasAuthority_by_id(admin_id, 6):
        quiz_id = request.args.get('quiz_id')
        if quiz_id is not None:
            quiz_service.delete_quiz(quiz_id)
        quizs = quiz_service.get_all_quiz()
        return render_template('manage_quiz.html', admin_account=admin_account, quizs=quizs)
    else:
        return render_template('login.html', error="权限不足")


@admin_bp.route('/train_model', methods=['POST', 'GET'])
def train_model():
    admin_account = request.args.get('admin_account')
    Para_C = request.args.get('Para_C')
    Para_A = request.args.get('Para_A')
    Para_b = request.args.get('Para_b')
    Para_Aeq = request.args.get('Para_Aeq')
    Para_beq = request.args.get('Para_beq')
    paras = [Para_C, Para_A, Para_b, Para_Aeq, Para_beq]
    return render_template('train_model.html', admin_account=admin_account)


@admin_bp.route('/introduce', methods=['GET'])
def introduce():
    admin_account = request.args.get('admin_account')
    return render_template('introduce.html', admin_account=admin_account)


@admin_bp.route('/guidance', methods=['GET'])
def guidance():
    admin_account = request.args.get('admin_account')
    return render_template('guidance.html', admin_account=admin_account)


@admin_bp.route('/progress')
def progress_update():
    return jsonify(progress=progress)


@admin_bp.route('/solver_progress')
def solver_progress():
    admin_account = request.args.get('admin_account')
    insType = request.args.get('insType')
    return render_template('wait.html', admin_account=admin_account)


def simulate_long_task():
    global progress
    for i in range(10):
        time.sleep(1)  # 模拟耗时操作
        progress = (i + 1) * 10
