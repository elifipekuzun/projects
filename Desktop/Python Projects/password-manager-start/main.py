from tkinter import *
from tkinter import messagebox
import random
import pyperclip
import json

window = Tk()
window.title("Password Manager")
window.config(padx=50, pady=50)

canvas = Canvas(width=200, height=200)
logo_img = PhotoImage(file="logo.png")
canvas_img = canvas.create_image(100, 100, image=logo_img)
canvas.grid(column=1, row=0)

letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
symbols = ['!', '#', '$', '%', '&', '(', ')', '*', '+']
nr_letters = random.randint(8, 10)
nr_symbols = random.randint(2, 4)
nr_numbers = random.randint(2, 4)


def search():
    website = input_website.get()
    try:
        with open("data.json", mode="r") as data_file:
            data = json.load(data_file)
            website_name = data[website]
    except FileNotFoundError:
        messagebox.showinfo(title="Empty File", message="The file is empty.")
    except KeyError:
        messagebox.showinfo(title="Oops, Sorry!", message="The given website does not found!")
    else:
        email = website_name["email"]
        password = website_name["password"]
        messagebox.showinfo(title=f"{website}", message=f"\nEmail: {email} \nPassword: {password}")


def generate_password():
    password_input.delete(0, END)
    password_list = [random.choice(letters) for _ in range(nr_letters)]
    password_list += [random.choice(symbols) for _ in range(nr_symbols)]
    password_list += [random.choice(numbers) for _ in range(nr_numbers)]
    random.shuffle(password_list)

    password = "".join(password_list)
    password_input.insert(0, f"{password}")
    pyperclip.copy(password)


def add_to_file():
    website_text = input_website.get()
    email_text = email_input.get()
    password_text = password_input.get()
    new_data = {
        website_text: {
                    "email": email_text,
                    "password": password_text,
        }
    }
    if website_text == "" or email_text == "" or password_text == "":
        messagebox.showerror(title="Warning!", message="You should fill all areas.")
    else:
        is_ok = messagebox.askokcancel(title=website_text, message=f"These are the details entered: "
                                                                   f"\nEmail: {email_text} \nPassword: {password_text}"
                                                                   f" \nIs it okay to save?")
        if is_ok:
            try:
                with open("data.json", mode="r") as data_file:
                    data = json.load(data_file)
                    data.update(new_data)
            except FileNotFoundError:
                with open("data.json", mode="w") as data_file:
                    json.dump(new_data, data_file)
            else:
                with open("data.json", mode="w") as data_file:
                    json.dump(data, data_file, indent=4)

            input_website.delete(0, END)
            password_input.delete(0, END)


label = Label(text="Website:", font=("Arial", 14))
label.grid(column=0, row=1)
input_website = Entry(width=21)
input_website.focus()
input_website.grid(row=1, column=1)
search_button = Button(text="Search", width=13, command=search)
search_button.grid(column=2, row=1)

username_label = Label(text="Email/Username:", font=("Arial", 14))
username_label.grid(column=0, row=2)
email_input = Entry(width=35)
email_input.insert(0, "elifipek@gmail.com")
email_input.grid(row=2, column=1, columnspan=2)

password_label = Label(text="Password:", font=("Arial", 14))
password_label.grid(row=3, column=0)
password_input = Entry(width=21)
password_input.grid(row=3, column=1)

button = Button(text="Generate Password", command=generate_password)
button.grid(row=3, column=2)

add_button = Button(text="Add", width=36, command=add_to_file)
add_button.grid(row=4, column=1, columnspan=2, pady=6)

window.mainloop()
