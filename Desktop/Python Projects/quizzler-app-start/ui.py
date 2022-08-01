from tkinter import *
from quiz_brain import QuizBrain
THEME_COLOR = "#375362"


class UI:
    def __init__(self, quiz_brain: QuizBrain):
        self.window = Tk()
        self.window.title("Quizzlet")
        self.window.config(padx=20, pady=20, bg=THEME_COLOR)
        self.s_score = quiz_brain.score
        self.score_label = Label(text="Score: 0", bg=THEME_COLOR, fg="white")
        self.score_label.grid(column=1, row=0, padx=20, pady=20)
        self.quiz = quiz_brain
        self.canvas = Canvas(width=300, height=300, bg="white", highlightthickness=0)
        self.canvas.grid(column=0, row=1, columnspan=2, pady=15)
        self.started_q = self.canvas.create_text(150, 150, text="", font=("Arial", 20, "italic"),
                                                 fill="black", width=280)

        true_img = PhotoImage(file="images/true.png")
        false_img = PhotoImage(file="images/false.png")
        self.true_button = Button(image=true_img, highlightthickness=0, command=self.true_clicked)
        self.false_button = Button(image=false_img, highlightthickness=0, command=self.false_clicked)
        self.true_button.grid(column=0, row=2)
        self.false_button.grid(column=1, row=2)
        self.show_question()
        self.window.mainloop()

    def show_question(self):
        self.score_label.config(text=f"Score: {self.quiz.score}")
        if self.quiz.still_has_questions():
            quiz_question = self.quiz.next_question()
            self.canvas.itemconfig(self.started_q, text=quiz_question)
        else:
            self.canvas.itemconfig(self.started_q, text=f"You've completed the quiz!\n"
                                                        f"Your final score: {self.quiz.score}/10")
            self.true_button.config(state="disable")
            self.false_button.config(state="disable")

    def true_clicked(self):
        canvas_color = self.quiz.check_answer("True")
        self.canvas.config(bg=canvas_color)
        self.window.after(300, func=self.give_feedback)

    def false_clicked(self):
        canvas_color = self.quiz.check_answer("False")
        self.canvas.config(bg=canvas_color)
        self.window.after(300, func=self.give_feedback)

    def give_feedback(self):
        self.canvas.config(bg="white")
        self.show_question()