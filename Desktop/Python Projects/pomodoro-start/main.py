from tkinter import *
import math

PINK = "#e2979c"
RED = "#e7305b"
GREEN = "#9bdeac"
YELLOW = "#f7f5dd"
FONT_NAME = "Courier"
WORK_MIN = 25
SHORT_BREAK_MIN = 5
LONG_BREAK_MIN = 20
timer = None

window = Tk()
window.title("Pomodoro")
window.config(padx=100, pady=50, bg=YELLOW)

timer_label = Label(text="Timer", fg=GREEN, font=(FONT_NAME, 35, "normal"), bg=YELLOW)
timer_label.grid(column=1, row=0)

canvas = Canvas(width=200, height=224, bg=YELLOW, highlightthickness=0)
tomato_img = PhotoImage(file="tomato.png")
canvas.create_image(100, 112, image=tomato_img)
canvas_timer = canvas.create_text(103, 130, text="00:00", fill="white", font=(FONT_NAME, 35, "bold"))
canvas.grid(column=1, row=1)

reps = 0
check = ""


def start_timer():
    global reps
    reps += 1
    if reps%2 == 1:
        countdown_timer(4)
        timer_label.config(text="Working time.", fg=GREEN)
    elif reps%2 == 0:
        global check
        check += "✔"
        check_label.config(text=check)
        if reps%8 == 0:
            countdown_timer(3)
            timer_label.config(text="Long Break.", fg=RED)
        else:
            countdown_timer(2)
            timer_label.config(text="Short Break.", fg=PINK)


def reset_timer():
    window.after_cancel(timer)
    canvas.itemconfig(canvas_timer, text="00:00")
    timer_label.config(text="Timer", fg=GREEN)
    global check
    check = ""
    check_label.config(text="")
    global reps
    reps = 0


def countdown_timer(counter):
    min = math.floor(counter / 60)
    sec = counter % 60
    if sec < 10:
        sec = f"0{sec}"
    canvas.itemconfig(canvas_timer, text=f"{min}:{sec}")
    if counter >= 0:
        global timer
        timer = window.after(1000, countdown_timer, counter-1)
    else:
        start_timer()


start_button = Button(text="Start", highlightthickness=0, command=start_timer)
start_button.grid(column=0, row=2)

check_label = Label(text="", fg=GREEN, bg=YELLOW, font=(FONT_NAME, 35, "normal"))
check_label.grid(column=1, row=2)

reset_button = Button(text="Reset", highlightthickness=0, command=reset_timer)
reset_button.grid(column=2, row=2)


window.mainloop()
