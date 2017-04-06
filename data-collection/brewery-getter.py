import requests
import json

brewery_file_path = 'data/breweries.json'
brewery_full_data_file_path = 'data/breweries-full-data.json'

endpoint = 'https://api.untappd.com/v4/brewery/info/{}'
credentials = {
	'client_id':'0FD0D1CB2D58F9D2F0231C8A95100E82440D5A78',
	'client_secret':'3B33831ECE20F94937DCFEFD9049F86235788203',
	}

required_brew_ids = set()
with open(brewery_file_path, 'r') as bf:
	for l in bf:
		bjs = json.loads(l)
		b_id = bjs['brewery_id']
		required_brew_ids.add(b_id)

already_fetched_ids = set()
with open(brewery_full_data_file_path, 'r') as bf:
	for l in bf:
		bjs = json.loads(l)
		b_id = bjs['brewery_id']
		already_fetched_ids.add(b_id)

remaining_ids = required_brew_ids - already_fetched_ids

for brew_id in remaining_ids:
	url = endpoint.format(brew_id)
	response = requests.get(url, params=credentials)
	if response.status_code == 200:
		try:
			resp_js = response.json()['response']['brewery']
			with open(brewery_full_data_file_path, 'a') as bf:
				json.dump(resp_js, bf)
				bf.write('\n')
		except Exception as e:
			print(e)
	else:
		print(response.json())
