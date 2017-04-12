import json
import requests
import codecs
from flask import jsonify

def get_keys():
	keys = []
	js = open('all_grocery_items.json')
	data = (json.load(js)).get('data')
	#real_data = data.get('data')
	for d in data:
		keys.append(d.get('id'))

	return keys

def save_request():
	keys = get_keys()
	path = "http://api.vennfridge.appspot.com/grocery_items/"
	#subkeys = [keys[0], keys[1]]

	with open('test.txt','w') as fd:
		fd.write('{\n"result" : [ \n')

	for id in keys:
		r = requests.get(path+str(id))
		with open('test.txt','a') as fd:
			fd.write(r.text+',\n')

	### DO NOT FORGET TO REMOVE LAST COMMA MANUALLY ###
	with open('test.txt','a') as fd:
		fd.write(']\n}')

save_request()