import json
import re
import os

def get_tag_info():
	tags = []
	related_grocery_items = []
	related_ingredients = []
	related_recipes = []
	js = open('tag_info.json')
	data = (json.load(js)).get('result')
	#real_data = data.get('data')
	for d in data:
		tags.append(d.get('name'))
		related_grocery_items.append(d.get('related_grocery_items'))
		related_ingredients.append(d.get('related_ingredients'))
		related_recipes.append(d.get('related_recipes'))


	data = [tags, related_grocery_items, related_ingredients, related_recipes]
	return data

def get_grocery_item_names():
	names = []
	js = open('grocery_item_info.json')
	data = (json.load(js)).get('result')
	#real_data = data.get('data')
	for d in data:
		names.append(d.get('name'))

	return names

def get_ingredient_names():
	names = []
	js = open('ingredient_info.json')
	data = (json.load(js)).get('result')
	#real_data = data.get('data')
	for d in data:
		names.append(d.get('name'))

	return names

def get_recipe_ingredients():
	names = []
	ingredients = []
	js = open('recipe_info.json')
	data = (json.load(js)).get('result')
	#real_data = data.get('data')
	for d in data:
		names.append(d.get('name'))
		ingredients.append(d.get('ingredient_list'))

	result = [names, ingredients]
	return result

def print_recipe_ingredients():
	result = []

	return result

def get_recipe(id):
	pass

def get_grocery(id):
	pass

def get_tag_ingredients(id):
	pass

def get_recipe_ingredients():
	pass


def create_file():
	tag_data = get_tag_info()
	tag_names = tag_data[0] #len 72
	tag_grocery = tag_data[1] # list of lists of dicts, len 72
	tag_ingredients = tag_data[2] #len 72
	tag_recipes = tag_data[3] #len 72
	ingredients = get_ingredient_names()
	grocery_items = get_grocery_item_names()
	recipe_ingredients = get_recipe_ingredients() #list of lists [names[], ingredients[{}]]
	#subtags = [tags[16], tags[17]]23

	with open('test.txt','w') as fd:
		fd.write('{"name" : "Tags","children":[')#openchild0

	for i in range(0,72):
		#build grocery item nodes
		with open('test.txt','a') as fd:
			fd.write('  {  "name" : "'+tag_names[i].encode('utf-8')+'",  "children":[') #openchild1
			fd.write('    {    "name" : "Grocery Items",    "children":[')#openchild2
			length = len(tag_grocery[i])
		for _ in range(0,length):
			with open('test.txt','a') as fd:
				if (_==0):
					fd.write('      {"name" : "'+tag_grocery[i][_].get('name').encode('utf-8')+'", "size":400}')
				else:
					fd.write(',      {"name" : "'+tag_grocery[i][_].get('name').encode('utf-8')+'", "size":400}')

		with open('test.txt','a') as fd:
			fd.write(']    },')#closechild2

		#build ingredient nodes
		with open('test.txt','a') as fd:
			fd.write('    {    "name" : "Ingredients",    "children":[')#openchild3
			length = len(tag_ingredients[i])
		for _ in range(0,length):
			with open('test.txt','a') as fd:
				if (_==0):
					fd.write('      {"name" : "'+tag_ingredients[i][_].get('name').encode('utf-8')+'", "size":400}')
				else:
					fd.write(',      {"name" : "'+tag_ingredients[i][_].get('name').encode('utf-8')+'", "size":400}')

		with open('test.txt','a') as fd:
			fd.write(']    },')#closechild3

		#build recipe nodes
		with open('test.txt','a') as fd:
			fd.write('    {    "name" : "Recipes",    "children":[')#openchild4
			length = len(tag_recipes[i])
		for _ in range(0,length):
			with open('test.txt','a') as fd:
				if (_==0):
					fd.write('      {"name" : "'+tag_recipes[i][_].get('name').encode('utf-8')+'", "size":400}')
				else:
					fd.write(',      {"name" : "'+tag_recipes[i][_].get('name').encode('utf-8')+'", "size":400}')

		with open('test.txt','a') as fd:
			###REMOVE LAST COMMA###
			fd.write(']    }]  },')#closechild4

	with open('test.txt','a') as fd:
		fd.write(']}')#closechild0

create_file()








	#to get related grocery items
	"""for _ in tag_grocery:
		with open('test.txt','a') as fd:
			try:
				for item in tag_grocery[0]:
					fd.write(item.get('name').encode('utf-8')+'\n') # _ is a list!
			except (IndexError, AttributeError):
				pass
			else:
				with open('test.txt','a') as fd:
					fd.write('[]'+'\n')
	"""
	#to get recipes and related ingredients
	"""for _ in tag_recipes:
		with open('test.txt','a') as fd:
			fd.write('{\n"name" : "Recipes",\n"children":[\n')
		with open('test.txt','a') as fd:
			try:
				for i in tag_recipes:
					if(i != ""):
						fd.write('{"name" : "')
						for item in i:
							fd.write(''+item.get('name').encode('utf-8')+'\n') # _ is a list!
						fd.write('"\n}\n')
			except (IndexError, AttributeError):
				pass
			else:
				with open('test.txt','a') as fd:
					fd.write('[]'+'\n')
		with open('test.txt','a') as fd:
			fd.write(']\n}')
	"""
	### DO NOT FORGET TO REMOVE LAST COMMA MANUALLY ###
	#with open('test.txt','a') as fd:
	#	fd.write('\n]\n}')













