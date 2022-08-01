import requests
from datetime import datetime

username = "elifuzun"
password = "588647elka"

sheety_end_point = "https://api.sheety.co/dbb584e7ed749ea6b5a32f273e5cbd0c/flightDeals/prices"
meta_search_api_key = "1v9qPdvqurw5sKrKwwpKM_NdQBLFvCHh"
tequila_end_point = "https://tequila-api.kiwi.com"

response = requests.get(url=sheety_end_point, auth=(username, password))
data = response.json()["prices"]
print(data)

header = {"apikey": meta_search_api_key}
codes = []
for each in data:
    city_name = each["city"]
    query = {"term": city_name, "location_types": "city"}
    r = requests.get(url=f"{tequila_end_point}/locations/query", params=query, headers=header)
    result = r.json()["locations"]
    update_loc_params = {
        "price": {
            "iataCode": result[0]["code"]
        }
    }
    if each["iataCode"] == "":
        resp = requests.put(url=f"{sheety_end_point}/{each['id']}", json=update_loc_params, auth=(username, password))

updated_res = requests.get(url=sheety_end_point, auth=(username, password))
updated_data = updated_res.json()["prices"]

today = datetime.today().strftime("%d/%m/%Y")
next_month = (((datetime.today().month - 1) + 6) % 12) + 1
next_year = int(datetime.today().year + (((datetime.today().month - 1) + 6) / 12))
next_date = datetime(year=next_year, month=next_month, day=datetime.today().day)
formatted_next_date = next_date.strftime("%d/%m/%Y")

for each in updated_data:
    flight_params = {
        "fly_from": "IST",
        "fly_to": each["iataCode"],
        "date_from": today,
        "date_to": formatted_next_date,
        "price_to": each["lowestPrice"],
    }
    r = requests.get(url=f"{tequila_end_point}/v2/search", json=flight_params, headers=header)
    print(r.text)
