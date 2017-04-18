import requests
import json

venue_file_path = 'data/venues.json'

endpoint = 'https://api.untappd.com/v4/venue/info/{}'
credentials = {
	'client_id':'0FD0D1CB2D58F9D2F0231C8A95100E82440D5A78',
	'client_secret':'3B33831ECE20F94937DCFEFD9049F86235788203',
	}

retrieved_v_ids = []
with open(venue_file_path, 'r') as vf:
	for l in vf:
		vjs = json.loads(l)
		v_id = vjs['venue_id']
		retrieved_v_ids.append(v_id)

start = max(retrieved_v_ids) + 1
end = start + 15

for venue_id in range(start, end):
	url = endpoint.format(venue_id)
	response = requests.get(url, params=credentials)
	if response.status_code == 200:
		try:
			resp_js = response.json()['response']['venue']
			if resp_js['top_beers']['count'] > 0:
				with open(venue_file_path, 'a') as vf:
					json.dump(resp_js, vf)
					vf.write('\n')
		except:
			pass
	else:
		print(response)

