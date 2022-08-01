import pandas

student_dict = {
    "student": ["Angela", "James", "Lily"], 
    "score": [56, 76, 98]
}
not_letters = True

while not_letters:
    try:
        word = input("Enter a word: ").upper()
        student_data_frame = pandas.DataFrame(student_dict)
        df_alphabet = pandas.read_csv("nato_phonetic_alphabet.csv")
        nato_dict = {row.letter: row.code for (index, row) in df_alphabet.iterrows()}
        code_for_word = [nato_dict[char] for char in word]
    except KeyError:
        print("Sorry, only letter in the alphabet please.")
    else:
        not_letters = False
        print(code_for_word)



