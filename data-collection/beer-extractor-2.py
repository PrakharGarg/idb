import json

beer_file_path = 'data/beers.json'
brewery_full_data_file_path = 'data/breweries-full-data.json'

bws = []
with open(brewery_full_data_file_path, 'r') as bf:
	for l in bf:
		bws.append(json.loads(l))



already_fetched_beer_ids = set()
with open(brewery_full_data_file_path, 'r') as bf:
	for l in bf:
		bjs = json.loads(l)
		b_id = bjs['brewery_id']
		already_fetched_ids.add(b_id)
