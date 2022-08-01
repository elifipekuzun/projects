from tkinter import *
import pandas
import random
BACKGROUND_COLOR = "#B1DDC6"
words_panda = pandas.read_csv("./data/french_words.csv")
words_list = words_panda.to_dict(orient="records")
window = Tk()
window.title("Flashy")
window.config(bg=BACKGROUND_COLOR, padx=50, pady=50)


def game_on():
    words = []
    index_num = random.randint(0, len(words_list)-1)
    french_word = words_list[index_num]
    if len(words_list) == 0:
        print("You know every word on this list now!")
        return

    def right_button_clicked():
        global words_list
        words.append(french_word)
        df = pandas.DataFrame(words, columns=["French", "English"])
        df.to_csv("./data/known_words.csv", mode="a", header=False, index=False)
        words_list.remove(french_word)
        learn_to_file = pandas.DataFrame(words_list)
        learn_to_file.to_csv("./data/french_words.csv", mode="w", index=False)
        game_on()

    def wrong_button_clicked():
        game_on()

    def flip_card():
        canvas.itemconfig(canvas_img_back, image=img_card_front)
        canvas.itemconfig(canvas_t1, text="English", fill="black")
        canvas.itemconfig(canvas_t2, text=french_word["English"], fill="black")

    img_card_back = PhotoImage(file="./images/card_back.png")
    img_card_front = PhotoImage(file="./images/card_front.png")
    canvas = Canvas(width=800, height=526, bg=BACKGROUND_COLOR, highlightthickness=0)
    canvas_img_back = canvas.create_image(400, 263, image=img_card_back)
    canvas.grid(column=0, row=0, columnspan=2)
    canvas_t1 = canvas.create_text(400, 150, text="French", font=("Arial", 40, "italic"), fill="white")
    canvas_t2 = canvas.create_text(400, 263, text=french_word["French"], font=("Arial", 60, "bold"), fill="white")
    window.after(3000, func=flip_card)

    wrong_img = PhotoImage(file="./images/wrong.png")
    right_img = PhotoImage(file="./images/right.png")
    wrong_button = Button(image=wrong_img, highlightthickness=0, command=wrong_button_clicked)
    wrong_button.grid(column=1, row=1)
    right_button = Button(image=right_img, highlightthickness=0, command=right_button_clicked)
    right_button.grid(column=0, row=1)





    window.mainloop()


game_on()
