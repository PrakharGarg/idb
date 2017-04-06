import requests
import json

from app.models import Beer, Brewery, Venue, State

class Data:
	""" data collection management class """

	data_dir = 'data'
	metadata_file = '/'.join([data_dir, 'metadata.json'])

	endpoint = 'https://api.untappd.com/v4/{}/info/{}'
	credentials = {
		'client_id':'0FD0D1CB2D58F9D2F0231C8A95100E82440D5A78',
		'client_secret':'3B33831ECE20F94937DCFEFD9049F86235788203'
	}

	def __init__(self):
		self.read_metadata()

	def file_path(state, which):
		return '/'.join([Data.data_dir, state, which])+'.json'

	def read_metadata(self):
		with open(Data.metadata_file, 'r') as f:
			self.metadata = json.load(f)

	def write_metadata(self):
		with open(Data.metadata_file, 'w') as f:
			return json.dump(self.metadata, f)

	def inspect(self, which):
		with open(Data.file_path('raw', which), 'r') as f:
			return json.loads(f.readline())

	def get_all(self, which):
		all_data = []
		with open(Data.file_path('raw', which), 'r') as f:
			for l in f:
				all_data.append(json.loads(l))
		return all_data

	def get_id(self, which, js):
		if which == 'beer':
			idd = js['beer']['bid']
		elif which == 'venue':
			idd = js['venue_id']
		else:
			idd = js['brewery_id']
		return idd

	def get_collected_ids(self, which):
		ids = set()
		with open(Data.file_path('raw', which), 'r') as f:
			for l in f:
				js = json.loads(l)
				idd = self.get_id(which, js)
				ids.add(idd)
		return ids

	def extract_beers_from_breweries(self):
		all_brews = self.get_all('brewery')
		with open(Data.file_path('raw', 'beer'), 'a') as bf:
			for brw in all_brews:
				beers = brw['beer_list']['items']
				for beer in beers:
					json.dump(beer, bf)
					bf.write('\n')

	def collect_data(self):
		self.read_metadata()
		next_venue = max(self.metadata['collected_venues']) + 1
		url = endpoint.format('venue', next_venue_id)

	def clean_data(self):
		for t in ['beer','venue','brewery']:
			self.remove_dups(t)
		self.condense_data()

	def condense_data(self):
		self.condense_venue_data()
		self.condense_beer_data()
		self.condense_brewery_data()

	def remove_dups(self, which):
		data = self.get_all(which)
		written_ids = set()
		with open(Data.file_path('raw', which), 'w') as df:
			for d in data:
				did = self.get_id(which, d)
				if did not in written_ids:
					json.dump(d, df)
					df.write('\n')
					written_ids.add(did)

	def condense_venue_data(self):
		vs = self.get_all('venue')
		with open(Data.file_path('clean','venue'), 'w') as vf:
			for v in vs:
				v = Venue(
					id=v['venue_id'],
					name=v['venue_name'],
					media=v['media'],
					address=v['location'],
					category=v['categories'],
					is_public=v['public_venue'])
				json.dump(v.to_dict(), vf)
				vf.write('\n')

	def condense_beer_data(self):
		bs = self.get_all('beer')
		with open(Data.file_path('clean','beer'), 'w') as bf:
			for b in bs:
				b = Beer(
					id=b['beer']['bid'],
					name=b['beer']['beer_name'],
					label=b['beer']['beer_label'],
					style=b['beer']['beer_style'],
					ibu=b['beer']['beer_ibu'],
					abv=b['beer']['beer_style'],
					rating=b['beer']['rating_score'] )
				json.dump(b.to_dict(), bf)
				bf.write('\n')

	def condense_brewery_data(self):
		bs = self.get_all('brewery')
		with open(Data.file_path('clean','brewery'), 'w') as bf:
			for b in bs:
				b = Brewery(
					id=b['brewery_id'],
				    name=b['brewery_name'],
				    brewery_type=b['brewery_type'],
				    founded=b['stats']['age_on_service'],
				    label=b['brewery_label'],
				    address=', '.join([
				    	str(b['location']['brewery_address']),
				    	str(b['location']['brewery_city']),
				    	str(b['location']['brewery_state']) ]),
				    state_id=b['location']['brewery_state']
				    )
				json.dump(b.to_dict(), bf)
				bf.write('\n')

	def create_metadata(self):
		""" record all the ids and relationships collected thus far """
		beer_ids = list(self.get_collected_ids('beer'))
		brewery_ids = list(self.get_collected_ids('brewery'))
		venue_ids = list(self.get_collected_ids('venue'))

		venues = self.get_all('venue')
		ven2beer = {}
		ven2brew = {}
		for v in venues:
			v_id = self.get_id('venue', v)

			if v_id not in ven2beer:
				ven2beer[v_id] = []
			if v_id not in ven2brew:
				ven2brew[v_id] = []

			beer_assocs = v['top_beers']['items']
			for b in beer_assocs:
				ven2beer[v_id].append(b['beer']['bid'])
				ven2brew[v_id].append(b['brewery']['brewery_id'])
		del venues

		breweries = self.get_all('brewery')
		brew2beer = {}
		for brw in breweries:
			brw_id = self.get_id('brewery', brw)

			if brw_id not in brew2beer:
				brew2beer[brw_id] = []
			
			beer_assocs = brw['beer_list']['items']
			for b in beer_assocs:
				brew2beer[brw_id].append(b['beer']['bid'])
		del breweries

		beers = self.get_all('beer')
		beer2brew = {}
		for b in beers:
			bid = self.get_id('beer', b)

			if bid not in beer2brew:
				beer2brew[bid] = []
			
			brew_assoc = b['brewery']
			beer2brew[bid].append(brew_assoc['brewery_id'])
		del beers

		brew2ven = {}
		for v_id, brw_ids in ven2beer.items():
			for brw_id in brw_ids:
				if brw_id not in brew2ven:
					brew2ven[brw_id] = []
				brew2ven[brw_id].append(v_id)

		self.metadata  = {
			'collected_beers': beer_ids,
			'collected_breweries':  brewery_ids,
			'collected_venues':  venue_ids,

			'venues_to_beers': ven2beer,
			'venues_to_breweries': ven2brew,
			'beers_to_breweries': beer2brew, 
			'breweries_to_beers': brew2beer,
			'breweries_to_venues': brew2ven
		}
		self.write_metadata()

		


