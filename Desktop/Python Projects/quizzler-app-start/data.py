import requests


class Data:
    def __init__(self):
        response = requests.get(url="https://opentdb.com/api.php?amount=10&difficulty=easy&type=boolean")
        response.raise_for_status()
        self.question_data = response.json()["results"]

