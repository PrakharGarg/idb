import json

venue_file_path = 'data/venues.json'
beer_file_path = 'data/beers.json'

venues = []
with open(venue_file_path, 'r') as vf:
	for l in vf:
		venues.append(json.loads(l))

beers = set()
for venue in venues:
	try:
		top_beers = venue['top_beers']['items']
		for tb in top_beers:
			beers.add(json.dumps(tb))
	except Exception as e:
		print(e)

with open(beer_file_path, 'a') as bf:
	for beer in beers:
		bf.write(beer)
		bf.write('\n')
