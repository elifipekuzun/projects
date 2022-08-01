from turtle import Turtle
FONT = ("Courier", 24, "normal")


class Scoreboard(Turtle):
    def __init__(self):
        super().__init__()
        self.penup()
        self.hideturtle()
        self.level_score = 1

    def game_over(self):
        self.write("Game Over.", align="center", font=FONT)

    def level(self):
        self.clear()
        self.goto(-230, 270)
        self.write(f"Level: {self.level_score}", align="center", font=FONT)
