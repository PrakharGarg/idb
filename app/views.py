from flask import render_template, abort, jsonify
from app import app
from app.models import *
from flask_sqlalchemy import SQLAlchemy
import subprocess

@app.route('/unittests/', methods=['GET', 'POST'])
def test() :
    output = subprocess.getoutput("python3 app/tests.py")
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

# Page that shows our technical report.
@app.route('/technical/')
def technical() :
    return render_template('technical.html')

# Page that shows all of the beers in a grid    
@app.route('/beers/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def beers() :
    json_query = Beer.query.all()
    return render_template('beers.html', json_query = json_query)

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
    json_query = Venue.query.all()
    return render_template('venues.html', json_query = json_query)

# Page that shows info about a specific venue with
# the name of the venue being passed in 
@app.route('/venues/<venue_id>/')
def venue(venue_id) :
    venue_info = Venue.query.filter_by(id = venue_id).first()
    
    return render_template('venue.html', 
        venue_info = venue_info)

# Page that shows all of the breweries in a grid
@app.route('/breweries/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def breweries() :
    json_query = Brewery.query.all()
    return render_template('breweries.html', json_query = json_query)
# Page that shows info about a specific brewery with
# the name of the brewery being passed in
@app.route('/breweries/<brewery_id>/')
def brewery(brewery_id):
    brewery_info = Brewery.query.filter_by(id = brewery_id).first()

    return render_template('brewery.html',
        brewery_info = brewery_info)

# Page that shows all of the locations in a grid
@app.route('/states/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def states() :
    json_query = State.query.all()
    return render_template('states.html', json_query = json_query)

# Page that shows info about a specific location with
# the name of the location being passed in 
@app.route('/states/<state_id>/')
def state(state_id) :
    state_info = State.query.filter_by(id = state_id).first()

    return render_template('state.html', 
        state_info = state_info)

# API GET methods

@app.route('/api/beers', methods=['GET'])
def get_beers():
    beers = Beer.query.all()
    beer_names = list()
    for beer in beers:
        beer_names += beer.name
    return jsonify({'result' : beer_names})

@app.route('/api/beer/<beer_name>', methods=['GET'])
def get_beer_info(beer_name):
    beer = Beer.query.filter_by(name=beer_name).first()

    if not beer:
        abort(404)
    return jsonify({'result' : beer})

@app.route('/api/venues', methods=['GET'])
def get_venues():
    venues = Venue.query.all()
    venue_names = list()
    for venue in venues:
        venue_names += venue.name
    return jsonify({'result' : venue_names})

@app.route('/api/venue/<venue_name>', methods=['GET'])
def get_venue_info(venue_name):
    venue = Venue.query.filter_by(name=venue_name)

    if not venue:
        abort(404)
    return jsonify({'result' : venue.dictify()})

@app.route('/api/breweries', methods=['GET'])
def get_breweries():
    breweries = Brewery.query.all()
    brewery_names = list()
    for brewery in breweries:
        brewery_names += brewery.name
    return jsonify({'result' : brewery_names})

@app.route('/api/brewery/<brewery_name>', methods=['GET'])
def get_brewery_info(brewery_name):
    brewery = Brewery.query.filter_by(name=brewery_name)

    if not brewery:
        abort(404)
    return jsonify({'result' : brewery.dictify()})

@app.route('/api/states', methods=['GET'])
def get_states():
    states = State.query.all()
    state_names = list()
    for state in states:
        state_names += state.name
    return jsonify({'result' : state_names})

@app.route('/api/state/<state_name>', methods=['GET'])
def get_state_info(state_name):
    state = State.query.filter_by(name=state_name)

    if not state:
        abort(404)
    return jsonify({'result' : state.dictify()})
