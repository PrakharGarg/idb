import json
import requests
import codecs
from flask import jsonify

def get_keys():
	keys = []
	js = open('all_ingredients.json')
	data = (json.load(js)).get('data')
	#real_data = data.get('data')
	for d in data:
		keys.append(d.get('id'))

	return keys

def save_request():
	keys = get_keys()
	path = "http://api.vennfridge.appspot.com/ingredients/"
	all_data = list()
	"""for id in keys:
		r = requests.get(path+str(id))
		all_data+=[r.text]
	"""
	r = requests.get(path+str(keys[0]))
	all_data+=[r.text]
	data = {'result' : all_data}
	#with open('test.txt','w') as fd:
	#	json.dump(data, fd)
	with open('test.txt','w') as fd:
		fd.write(data.text)

save_request()