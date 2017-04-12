import json
import requests
import re

def get_tag_names():
	tags = []
	js = open('all_tags.json')
	data = (json.load(js)).get('data')
	#real_data = data.get('data')
	for d in data:
		tags.append(d.get('name'))

	return tags

def save_request():
	tags = get_tag_names()
	path = "http://api.vennfridge.appspot.com/tags/"
	#subtags = [tags[16], tags[17]]

	with open('test.txt','w') as fd:
		fd.write('{\n"result" : [ \n')

	for name in tags:
		r = requests.get(path+name)
		with open('test.txt','a') as fd:
			fd.write(r.text+',\n')

	### DO NOT FORGET TO REMOVE LAST COMMA MANUALLY ###
	with open('test.txt','a') as fd:
		fd.write(']\n}')

save_request()