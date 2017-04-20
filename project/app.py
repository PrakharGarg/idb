from flask import Flask, render_template, request, abort, jsonify
from flask_cors import CORS, cross_origin
from flask_sqlalchemy import SQLAlchemy
import os
import subprocess
import unittest
import io
import copy
from flask import Markup

#import sensitive

app = Flask(__name__)
CORS(app)
# app.config['SQLALCHEMY_DATABASE_URI'] = sensitive.DATABASE['postgres']
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/poh'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
from models import *
from tests import TestModels

@app.route('/unittests/', methods=['GET', 'POST'])
def test() :

    suite = unittest.defaultTestLoader.loadTestsFromTestCase(TestModels)
    output = io.BytesIO()
    runner = unittest.TextTestRunner(stream=output)
    runner.run(suite)

    output = output.getvalue()
    
    return render_template("unittests.html", output = output)

# Index page that contains a carousel
# Can be accessed at either / or /index/
@app.route('/')
@app.route('/index/')
def index() :
    return render_template('index.html')

# Page that shows our about page
@app.route('/about/')
def about() :
    return render_template('about.html')
    
@app.route('/search/', methods=['GET', 'POST'])
def search() :
    # Get the search value that the user inputed
    value = request.form['search']
    # Split the words into a list
    values = value.split()
    andResult = []
    orResult = []
    
    for model in Beer.query.all() :
        or_model_dict = copy.deepcopy(model.__dict__)
        or_model_dict["results"] = {}
        or_model_dict["match_found"] = False
        for key in or_model_dict.keys():
            for word in values :
                try:
                    if word.lower() in str(or_model_dict[key]).lower() and "results" not in key and "media" not in key and key != "label" and "instance" not in key and "match_key" not in key and "match_beginning" not in key and "match_word" not in key and "match_end" not in key and "match_found" not in key :
                        if key not in or_model_dict["results"] :
                            a = {"match_word" : [word] }
                            or_model_dict["results"][key] = a
                            or_model_dict["type"] = "beers"
                            or_model_dict["match_found"] = True
                        else :
                            or_model_dict["results"][key]["match_word"] += [word]
                except:
                    pass
        if or_model_dict["match_found"] :
            # or_model_dict["length"] = len(or_model_dict["match_key"])
            for key in or_model_dict["results"]:
                index = 10000
                index_array = []
                newstring = str((key + ": " + or_model_dict[key])).lower()
                for word in or_model_dict["results"][key]["match_word"]:
                    new_word = "<span class = 'gold'>" + word + "</span>"
                    newstring = newstring.replace(word.lower(), new_word)
                    newstring += "<br />"
                or_model_dict["results"][key]["string"] = Markup(newstring)
            orResult.append(or_model_dict)
                
        
    
    # # Get all of the beer matches
    # for word in values :
    #     for model in Beer.query.all() :
    #         model_dictionary = model.__dict__
    #         for key in model_dictionary.keys():
    #             try:
    #                 if word.lower() in str(model_dictionary[key]).lower() and "media" not in key and key != "label" and "instance" not in key :
    #                     if not any(d['id'] == model.id for d in orResult):
    #                         model_dictionary["match_key"] = key
    #                         index = str(model_dictionary[key]).lower().index(word.lower())
    #                         beginning_sub = str(model_dictionary[key])[:index]
    #                         model_dictionary["match_beginning"] = beginning_sub
    #                         model_dictionary["match_word"] = word
    #                         index += len(word)
    #                         end_sub = str(model_dictionary[key])[index:]
    #                         model_dictionary["match_end"] = end_sub
    #                         model_dictionary["type"] = "beers"
    #                         model_dictionary["id"] = model.id
    #                         orResult.append(model_dictionary)
    #             except: 
    #                 pass
    #             try:
    #                 if value.lower() in str(model_dictionary[key]).lower() and "media" not in key and "label" not in key and "instance" not in key :
    #                     if not any(d['id'] == model.id for d in andResult):
    #                         model_dictionary["match_key"] = key
    #                         index = str(model_dictionary[key]).lower().index(value.lower())
    #                         beginning_sub = str(model_dictionary[key])[:index]
    #                         model_dictionary["match_beginning"] = beginning_sub
    #                         model_dictionary["match_word"] = value
    #                         index += len(value)
    #                         end_sub = str(model_dictionary[key])[index:]
    #                         model_dictionary["match_end"] = end_sub
    #                         model_dictionary["type"] = "beers"
    #                         model_dictionary["id"] = model.id
    #                         andResult.append(model_dictionary)
    #             except: 
    #                 pass
    # # Get all of the Brewery matches
    # for word in values :
    #     for model in Brewery.query.all() :
    #         model_dictionary = model.__dict__
    #         for key in model_dictionary.keys():
    #             try:
    #                 if word.lower() in str(model_dictionary[key]).lower() and "media" not in key and key != "label" and "instance" not in key :
    #                     if not any(d['id'] == model.id for d in orResult):
    #                         model_dictionary["match_key"] = key
    #                         index = str(model_dictionary[key]).lower().index(word.lower())
    #                         beginning_sub = str(model_dictionary[key])[:index]
    #                         model_dictionary["match_beginning"] = beginning_sub
    #                         model_dictionary["match_word"] = word
    #                         index += len(word)
    #                         end_sub = str(model_dictionary[key])[index:]
    #                         model_dictionary["match_end"] = end_sub
    #                         model_dictionary["type"] = "breweries"
    #                         model_dictionary["id"] = model.id
    #                         orResult.append(model_dictionary)
    #             except: 
    #                 pass
    #             try:
    #                 if value.lower() in str(model_dictionary[key]).lower() and "media" not in key and key != "label" and "instance" not in key :
    #                     if not any(d['id'] == model.id for d in andResult):
    #                         model_dictionary["match_key"] = key
    #                         index = str(model_dictionary[key]).lower().index(value.lower())
    #                         beginning_sub = str(model_dictionary[key])[:index]
    #                         model_dictionary["match_beginning"] = beginning_sub
    #                         model_dictionary["match_word"] = value
    #                         index += len(value)
    #                         end_sub = str(model_dictionary[key])[index:]
    #                         model_dictionary["match_end"] = end_sub
    #                         model_dictionary["type"] = "breweries"
    #                         model_dictionary["id"] = model.id
    #                         andResult.append(model_dictionary)
    #             except: 
    #                 pass
    # # Get all of the State matches
    # for word in values :
    #     for model in State.query.all() :
    #         model_dictionary = model.__dict__
    #         for key in model_dictionary.keys():
    #             try:
    #                 if word.lower() in str(model_dictionary[key]).lower() and "media" not in key and key != "label" and "instance" not in key :
    #                     if not any(d['id'] == model.abbreviation for d in orResult):
    #                         model_dictionary["match_key"] = key
    #                         index = str(model_dictionary[key]).lower().index(word.lower())
    #                         beginning_sub = str(model_dictionary[key])[:index]
    #                         model_dictionary["match_beginning"] = beginning_sub
    #                         model_dictionary["match_word"] = word
    #                         index += len(word)
    #                         end_sub = str(model_dictionary[key])[index:]
    #                         model_dictionary["match_end"] = end_sub
    #                         model_dictionary["type"] = "states"
    #                         model_dictionary["id"] = model.abbreviation
    #                         orResult.append(model_dictionary)
    #             except: 
    #                 pass
    #             try:
    #                 if value.lower() in str(model_dictionary[key]).lower() and "media" not in key and key != "label" and "instance" not in key :
    #                     if not any(d['id'] == model.abbreviation for d in andResult):
    #                         model_dictionary["match_key"] = key
    #                         index = str(model_dictionary[key]).lower().index(value.lower())
    #                         beginning_sub = str(model_dictionary[key])[:index]
    #                         model_dictionary["match_beginning"] = beginning_sub
    #                         model_dictionary["match_word"] = value
    #                         index += len(value)
    #                         end_sub = str(model_dictionary[key])[index:]
    #                         model_dictionary["match_end"] = end_sub
    #                         model_dictionary["type"] = "states"
    #                         model_dictionary["id"] = model.abbreviation
    #                         andResult.append(model_dictionary)
    #             except: 
    #                 pass
    #                 
    # # Get all of the Venue matches
    # for word in values :
    #     for model in Venue.query.all() :
    #         model_dictionary = model.__dict__
    #         for key in model_dictionary.keys():
    #             try:
    #                 if word.lower() in str(model_dictionary[key]).lower() and "media" not in key and key != "label" and "instance" not in key :
    #                     if not any(d['id'] == model.id for d in orResult):
    #                         model_dictionary["match_key"] = key
    #                         index = str(model_dictionary[key]).lower().index(word.lower())
    #                         beginning_sub = str(model_dictionary[key])[:index]
    #                         model_dictionary["match_beginning"] = beginning_sub
    #                         model_dictionary["match_word"] = word
    #                         index += len(word)
    #                         end_sub = str(model_dictionary[key])[index:]
    #                         model_dictionary["match_end"] = end_sub
    #                         model_dictionary["type"] = "venues"
    #                         model_dictionary["id"] = model.id
    #                         orResult.append(model_dictionary)
    #             except: 
    #                 pass
    #             try:
    #                 if value.lower() in str(model_dictionary[key]).lower() and "media" not in key and key != "label" and "instance" not in key :
    #                     if not any(d['id'] == model.id for d in andResult):
    #                         model_dictionary["match_key"] = key
    #                         index = str(model_dictionary[key]).lower().index(value.lower())
    #                         beginning_sub = str(model_dictionary[key])[:index]
    #                         model_dictionary["match_beginning"] = beginning_sub
    #                         model_dictionary["match_word"] = value
    #                         index += len(value)
    #                         end_sub = str(model_dictionary[key])[index:]
    #                         model_dictionary["match_end"] = end_sub
    #                         model_dictionary["type"] = "venues"
    #                         model_dictionary["id"] = model.id
    #                         andResult.append(model_dictionary)
    #             except: 
    #                 pass
    # 
    orHeader = value.replace(" ", " OR ")
    andHeader = value.replace(" ", " AND ")
    
        
    return render_template('search.html',orResult = orResult, orHeader = orHeader, andHeader = andHeader)
    
@app.route('/visualization/')
def visual() :
    return render_template('visualization.html')

# Page that shows our technical report.
@app.route('/technical/')
def technical() :
    return render_template('technical.html')

# Page that shows all of the beers in a grid    
@app.route('/beers/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def beers() :
    return render_template('beers.html')

# Page that shows info about a specific beer with
# the name of the beer being passed in   
@app.route('/beers/<beer_id>/')
def beer(beer_id) :
    beer_info = Beer.query.filter_by(id = beer_id).first()
    return render_template('beer.html', 
        beer_info = beer_info)

# Page that shows all of the venues in a grid
@app.route('/venues/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def venues() :
    return render_template('venues.html')

# Page that shows info about a specific venue with
# the name of the venue being passed in 
@app.route('/venues/<venue_id>/')
def venue(venue_id) :
    venue_info = Venue.query.filter_by(id = venue_id).first()
    brews = db.session.query(ven2brew).filter_by(venue_id = venue_id).all()
    brew = []
    for i in brews :
        brew += Brewery.query.filter_by(id = i[0]).all()
    beers = db.session.query(ven2beer).filter_by(venue_id = venue_id).all()
    beer = []
    for i in beers :
        beer += Beer.query.filter_by(id = i[1]).all()
    return render_template('venue.html', 
        venue_info = venue_info, brews = brew, beers = beer)

# Page that shows all of the breweries in a grid
@app.route('/breweries/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def breweries() :
    return render_template('breweries.html')
# Page that shows info about a specific brewery with
# the name of the brewery being passed in
@app.route('/breweries/<brewery_id>/')
def brewery(brewery_id):
    beers = Beer.query.filter_by(brewery_id = brewery_id).all()
    venue = db.session.query(ven2brew).filter_by(brewery_id = brewery_id).all()
    venues = []
    for i in venue :
        venues += Venue.query.filter_by(id = i[1]).all()
    brewery_info = Brewery.query.filter_by(id = brewery_id).first()

    return render_template('brewery.html',
        brewery_info = brewery_info, venues = venues, beers = beers)

# Page that shows all of the locations in a grid
@app.route('/states/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def states() :
    return render_template('states.html')

# Page that shows info about a specific location with
# the name of the location being passed in 
@app.route('/states/<state_abbreviation>/')
def state(state_abbreviation) :
    state_info = State.query.filter_by(abbreviation = state_abbreviation).first()
    venues = Venue.query.filter_by(state_id = state_abbreviation).all()
    breweries = Brewery.query.filter_by(state_id = state_abbreviation).all()
    return render_template('state.html', 
        state_info = state_info, venues = venues, breweries = breweries)

# API GET methods

@app.route('/api/beers/', methods=['GET'])
def get_beers():
    beers = Beer.query.all()
    _ = list()
    for beer in beers:
        _ += [beer.to_dict()]
    return jsonify({'result' : _})

@app.route('/api/beer/<beer_id>', methods=['GET'])
def get_beer_info(beer_id):
    beer = Beer.query.filter_by(id=beer_id).first()

    if not beer:
        abort(404)
    return jsonify({'result' : beer.to_dict()})

@app.route('/api/venues/', methods=['GET'])
def get_venues():
    venues = Venue.query.all()
    _ = list()
    for venue in venues:
        _ += [venue.to_dict()]
    return jsonify({'result' : _})

@app.route('/api/venue/<venue_id>', methods=['GET'])
def get_venue_info(venue_id):
    venue = Venue.query.filter_by(id=venue_id).first()

    if not venue:
        abort(404)
    return jsonify({'result' : venue.to_dict()})

@app.route('/api/breweries/', methods=['GET'])
def get_breweries():
    breweries = Brewery.query.all()
    _ = list()
    for brewery in breweries:
        _ += [brewery.to_dict()]
    return jsonify({'result' : _})

@app.route('/api/brewery/<brewery_id>', methods=['GET'])
def get_brewery_info(brewery_id):
    brewery = Brewery.query.filter_by(id=brewery_id).first()

    if not brewery:
        abort(404)
    return jsonify({'result' : brewery.to_dict()})

@app.route('/api/states/', methods=['GET'])
def get_states():
    states = State.query.all()
    _ = list()
    for state in states:
        _ += [state.to_dict()]
    return jsonify({'result' : _})

@app.route('/api/state/<state_abbreviation>', methods=['GET'])
def get_state_info(state_abbreviation):
    state = State.query.filter_by(abbreviation=state_abbreviation).first()

    if not state:
        abort(404)
    return jsonify({'result' : state.to_dict()})
    
    
if __name__ == '__main__':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port, debug=True)
