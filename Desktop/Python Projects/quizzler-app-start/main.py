from question_model import Question
from data import Data
from quiz_brain import QuizBrain
from ui import UI


def game_on():
    question_bank = []
    data = Data()
    for question in data.question_data:
        question_text = question["question"]
        question_answer = question["correct_answer"]
        new_question = Question(question_text, question_answer)
        question_bank.append(new_question)

    quiz = QuizBrain(question_bank)
    if quiz.still_has_questions():
        ui = UI(quiz)
        ui.show_question()
        game_on()


game_on()
