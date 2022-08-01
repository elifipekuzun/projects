from turtle import Turtle
import random
COLORS = ["red", "orange", "yellow", "green", "blue", "purple"]
STARTING_MOVE_DISTANCE = 5
MOVE_INCREMENT = 10


class CarManager(Turtle):
    def __init__(self):
        super().__init__()
        self.shape("square")
        self.color(random.choice(COLORS))
        self.shapesize(stretch_wid=1, stretch_len=2)
        self.penup()
        self.set_start_position()

    def set_start_position(self):
        self.goto(300, random.randint(-250, 250))
        self.left(180)

    def move(self, increment):
        x_pos = self.xcor()
        y_pos = self.ycor()
        x_pos -= increment
        self.goto(x_pos, y_pos)

