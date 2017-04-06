import json

beer_file_path = 'data/beers.json'
brewery_file_path = 'data/breweries.json'

beers = []
with open(beer_file_path, 'r') as bf:
	for l in bf:
		beers.append(json.loads(l))

breweries = set()
for beer in beers:
	try:
		brew_js = json.dumps(beer['brewery'])
		breweries.add(brew_js)
	except Exception as e:
		print(e)

with open(brewery_file_path, 'a') as bf:
	for brew_js in breweries:
		bf.write(brew_js)
		bf.write('\n')
