import requests
import json

class Data:
	""" data collection management class """

	data_dir = 'data/'

	files = {
		'beer': data_dir+'beers.json',
		'venue': data_dir+'venues.json',
		'brewery-full': data_dir+'breweries-full-data.json',
		'brewery': data_dir+'breweries.json',
		'meta': data_dir+'metadata.json'
	}

	endpoint = 'https://api.untappd.com/v4/{}/info/{}'
	credentials = {
		'client_id':'0FD0D1CB2D58F9D2F0231C8A95100E82440D5A78',
		'client_secret':'3B33831ECE20F94937DCFEFD9049F86235788203'
	}

	def __init__(self):
		self.read_metadata()

	def read_metadata(self):
		with open(Data.files['meta'], 'r') as f:
			self.metadata = json.load(f)

	def write_metadata(self):
		with open(Data.files['meta'], 'w') as f:
			return json.dump(self.metadata, f)

	def inspect(self, which):
		with open(Data.files[which], 'r') as f:
			return json.loads(f.readline())

	def get_all(self, which):
		all_data = []
		with open(Data.files[which], 'r') as f:
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
		ids = []
		with open(Data.files[which], 'r') as f:
			for l in f:
				js = json.loads(l)
				idd = self.get_id(which, js)
				ids.append(idd)
		return ids

	def create_metadata(self):
		""" record all the ids and relationships collected thus far """
		beer_ids = self.get_collected_ids('beer')
		brewery_ids = self.get_collected_ids('brewery-full')
		venue_ids = self.get_collected_ids('venue')

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

		breweries = self.get_all('brewery-full')
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
			'collected_beers': self.get_collected_ids('beer'),
			'collected_breweries':  self.get_collected_ids('brewery-full'),
			'collected_venues':  self.get_collected_ids('venue'),

			'venues_to_beers': ven2beer,
			'venues_to_breweries': ven2brew,
			'beers_to_breweries': beer2brew, 
			'breweries_to_beers': brew2beer,
			'breweries_to_venues': brew2ven
		}
		self.write_metadata()

		


