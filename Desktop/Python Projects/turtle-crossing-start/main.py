import time
from turtle import Screen
from player import Player
from car_manager import CarManager
from scoreboard import Scoreboard
import random


screen = Screen()
screen.setup(width=600, height=600)
screen.tracer(0)

player = Player()
screen.listen()
screen.onkey(key="Up", fun=player.move)

scoreboard_level = Scoreboard()
scoreboard_game_over = Scoreboard()

game_is_on = True
cars = []
distance = 5
while game_is_on:
    time.sleep(0.1)
    screen.update()
    scoreboard_level.level()
    for each in cars:
        each.move(distance)
        if player.distance(each) < 23:
            scoreboard_game_over.game_over()
            game_is_on = False
    loop_manager = random.randint(1, 6)
    if loop_manager == 1:
        car = CarManager()
        cars.append(car)
    loop_manager += 1
    if player.is_finish_line():
        scoreboard_level.level_score += 1
        distance += 10
        for each in cars:
            each.move(distance)

screen.exitonclick()
