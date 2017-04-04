from flask import render_template, jsonify, abort
from app import app
from flask_sqlalchemy import SQLAlchemy
from models import *

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
    json_query = [{
            "id": "bearded_seal",
            "name":"Bearded Seal",
            "labels":"https://untappd.akamaized.net/site/beer_logos/beer-_251610_5e1b7f6c8e4f14e29b5f2144ad7e.jpeg",
            "style":"Stout - Irish Dry",
            "abv":"6.1",
            "rating":"3.80086",
            "isOrganic":"N",
            "brewery":"Pinthouse Pizza",
            "brewery_id": "pinthouse_pizza",
            "state":"TX",
            "state_id":"texas"
        }, {
            "id":"bursted_citra",
            "name":"Bursted Citra",
            "labels":"https://s3.amazonaws.com/brewerydbapi/beer/ezGh5N/upload_r8SNni-large.png",
            "style":"IPA - American",
            "abv":"6",
            "rating":"3.86842",
            "isOrganic":"N",
            "brewery":"El Segundo Brewing Company",
            "brewery_id": "el_segundo_brewing_company",
            "state":"OR",
            "state_id":"oregon"
        }, {
            "id": "daydream_in_green",
            "name":"Daydream In Green",
            "labels":"https://untappd.akamaized.net/site/beer_logos/beer-1995566_d307c_sm.jpeg",
            "style":"IPA - Imperial / Double",
            "abv":"8.1",
            "rating":"4.44162",
            "isOrganic":"N",
            "brewery":"Other Half Brewing Company",
            "brewery_id": "other_half_brewing_company",
            "state":"NY",
            "state_id": "new_york"
        }]
    return render_template('beers.html', json_query = json_query)

# Page that shows info about a specific beer with
# the name of the beer being passed in   
@app.route('/beers/<beer_name>/')
def beer(beer_name) :
    beer_info = [{
            "id": "bearded_seal",
            "name":"Bearded Seal",
            "labels":"https://untappd.akamaized.net/site/beer_logos/beer-_251610_5e1b7f6c8e4f14e29b5f2144ad7e.jpeg",
            "style":"Stout - Irish Dry",
            "abv":"6.1",
            "rating":"3.80086",
            "isOrganic":"N",
            "brewery":"Pinthouse Pizza",
            "brewery_id": "pinthouse_pizza",
            "state":"TX",
            "state_id":"texas"
        }, {
            "id":"bursted_citra",
            "name":"Bursted Citra",
            "labels":"https://s3.amazonaws.com/brewerydbapi/beer/ezGh5N/upload_r8SNni-large.png",
            "style":"IPA - American",
            "abv":"6",
            "rating":"3.86842",
            "isOrganic":"N",
            "brewery":"El Segundo Brewing Company",
            "brewery_id": "el_segundo_brewing_company",
            "state":"OR",
            "state_id":"oregon"
        }, {
            "id": "daydream_in_green",
            "name":"Daydream In Green",
            "labels":"https://untappd.akamaized.net/site/beer_logos/beer-1995566_d307c_sm.jpeg",
            "style":"IPA - Imperial / Double",
            "abv":"8.1",
            "rating":"4.44162",
            "isOrganic":"N",
            "brewery":"Other Half Brewing Company",
            "brewery_id": "other_half_brewing_company",
            "state":"NY",
            "state_id": "new_york"
        }]
    beer_info = next((item for item in beer_info if item["id"] == beer_name), None)
    return render_template('beer.html', 
        name = beer_name, 
        beer_info = beer_info)

# Page that shows all of the venues in a grid
@app.route('/venues/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def venues() :
    json_query = [{
            "id": "craft_pride",
            "name":"Craft Pride",
            "category":"Nightlife Spot",
            "media":"https:\/\/untappd.akamaized.net\/venuelogos\/venue_597840_aaf578d8_bg_64.png",
            "address":"61 Rainey St Austin, TX",
            "is_public":"Yes",
            "beer":"Bearded Seal",
            "beer_id":"bearded_seal",
            "brewery":"Pinthouse Pizza",
            "brewery_id": "pinthouse_pizza",
            "state":"TX",
            "state_id":"texas"
        }, {
            "id": "rattle_n_hum",
            "name": "Rattle N Hum",
            "category":"Nightlife Spot",
            "media":"https:\/\/untappd.akamaized.net\/venuelogos\/venue_2845_e817b5a8_bg_64.png",
            "address":"14 E 33rd Street New York, NY",
            "is_public":"Yes",
            "beer":"Daydream In Green",
            "beer_id":"daydream_in_green",
            "brewery":"Other Half Brewing Company",
            "brewery_id":"other_half_brewing_company",
            "state":"NY",
            "state_id":"new_york"
        }, {
            "id": "the_beermongers",
            "name": "The BeerMongers",
            "category":"Nightlife Spot",
            "media":"https:\/\/untappd.akamaized.net\/venuelogos\/venue_8350_220bb816_bg_64.png",
            "address":"1125 SE Division St Portland, OR",
            "is_public":"Yes",
            "beer":"Bursted Citra",
            "beer_id":"bursted_citra",
            "brewery":"El Segundo Brewing Company",
            "brewery_id":"el_segundo_brewing_company",
            "state":"OR",
            "state_id":"oregon"
        }]
    return render_template('venues.html', json_query = json_query)

# Page that shows info about a specific venue with
# the name of the venue being passed in 
@app.route('/venues/<venue_name>/')
def venue(venue_name) :
    venue_info = [{
            "id": "craft_pride",
            "name":"Craft Pride",
            "category":"Nightlife Spot",
            "media":"https:\/\/untappd.akamaized.net\/venuelogos\/venue_597840_aaf578d8_bg_64.png",
            "address":"61 Rainey St Austin, TX",
            "is_public":"Yes",
            "beer":"Bearded Seal",
            "beer_id":"bearded_seal",
            "brewery":"Pinthouse Pizza",
            "brewery_id": "pinthouse_pizza",
            "state":"TX",
            "state_id":"texas"
        }, {
            "id": "rattle_n_hum",
            "name": "Rattle N Hum",
            "category":"Nightlife Spot",
            "media":"https:\/\/untappd.akamaized.net\/venuelogos\/venue_2845_e817b5a8_bg_64.png",
            "address":"14 E 33rd Street New York, NY",
            "is_public":"Yes",
            "beer":"Daydream In Green",
            "beer_id":"daydream_in_green",
            "brewery":"Other Half Brewing Company",
            "brewery_id":"other_half_brewing_company",
            "state":"NY",
            "state_id":"new_york"
        }, {
            "id": "the_beermongers",
            "name": "The BeerMongers",
            "category":"Nightlife Spot",
            "media":"https:\/\/untappd.akamaized.net\/venuelogos\/venue_8350_220bb816_bg_64.png",
            "address":"1125 SE Division St Portland, OR",
            "is_public":"Yes",
            "beer":"Bursted Citra",
            "beer_id":"bursted_citra",
            "brewery":"El Segundo Brewing Company",
            "brewery_id":"el_segundo_brewing_company",
            "state":"OR",
            "state_id":"oregon"
        }]
    
    venue_info = next((item for item in venue_info if item["id"] == venue_name), None)
    return render_template('venue.html', 
        name = venue_name, 
        venue_info = venue_info)

# Page that shows all of the breweries in a grid
@app.route('/breweries/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def breweries() :
    json_query = [{
            "id" : "el_segundo_brewing_company",
            "name":"El Segundo Brewing Company",
            "type":"Micro Brewery",
            "founded":"2011",
            "label":"https:\/\/untappd.akamaized.net\/site\/brewery_logos\/brewery-11688_fbaaa.jpeg",
            "address":"140 Main St El Segundo, CA",
            "beer":"Bursted Citra",
            "beer_id":"bursted_citra",
            "venue":"The BeerMongers",
            "venue_id":"the_beermongers",
            "state":"TX",
            "state_id":"texas"
        }, {
            "id" : "other_half_brewing_company",
            "name":"Other Half Brewing Company",
            "type":"Micro Brewery",
            "founded":"2014",
            "label":"https://untappd.akamaized.net/site/brewery_logos/brewery-OtherHalfBrewing_94785_7c587.jpeg",
            "address":"195 Centre St Brooklyn, NY",
            "beer":"Daydream In Green",
            "beer_id":"daydream_in_green",
            "venue":"Rattle N Hum",
            "venue_id":"rattle_n_hum",
            "state":"NY",
            "state_id":"new_york"
        }, {
            "id": "pinthouse_pizza",
            "name":"Pinthouse Pizza",
            "type":"Brew Pub",
            "founded":"2012",
            "label":"https:\/\/untappd.akamaized.net\/site\/brewery_logos\/brewery-pinthousepizza_43305.jpeg",
            "address":"4729 Burnet Rd Austin, TX",
            "beer":"Bearded Seal",
            "beer_id":"bearded_seal",
            "venue":"Craft Pride",
            "venue_id":"craft_pride",
            "state":"TX",
            "state_id":"texas"
        }]
    return render_template('breweries.html', json_query = json_query)
# Page that shows info about a specific brewery with
# the name of the brewery being passed in
@app.route('/breweries/<brewery_name>/')
def brewery(brewery_name):
    brewery_info = [{
        "id" : "el_segundo_brewing_company",
        "name":"El Segundo Brewing Company",
        "type":"Micro Brewery",
        "founded":"2011",
        "label":"https:\/\/untappd.akamaized.net\/site\/brewery_logos\/brewery-11688_fbaaa.jpeg",
        "address":"140 Main St El Segundo, CA",
        "beer":"Bursted Citra",
        "beer_id":"bursted_citra",
        "venue":"The BeerMongers",
        "venue_id":"the_beermongers",
        "state":"TX",
        "state_id":"texas"
        }, {
            "id" : "other_half_brewing_company",
            "name":"Other Half Brewing Company",
            "type":"Micro Brewery",
            "founded":"2014",
            "label":"https://untappd.akamaized.net/site/brewery_logos/brewery-OtherHalfBrewing_94785_7c587.jpeg",
            "address":"195 Centre St Brooklyn, NY",
            "beer":"Daydream In Green",
            "beer_id":"daydream_in_green",
            "venue":"Rattle N Hum",
            "venue_id":"rattle_n_hum",
            "state":"NY",
            "state_id":"new_york"
        }, {
            "id": "pinthouse_pizza",
            "name":"Pinthouse Pizza",
            "type":"Brew Pub",
            "founded":"2012",
            "label":"https:\/\/untappd.akamaized.net\/site\/brewery_logos\/brewery-pinthousepizza_43305.jpeg",
            "address":"4729 Burnet Rd Austin, TX",
            "beer":"Bearded Seal",
            "beer_id":"bearded_seal",
            "venue":"Craft Pride",
            "venue_id":"craft_pride",
            "state":"TX",
            "state_id":"texas"
        }]
    brewery_info = next((item for item in brewery_info if item["id"] == brewery_name), None)

    return render_template('brewery.html',
        name = brewery_name,
        brewery_info = brewery_info)

# Page that shows all of the locations in a grid
@app.route('/states/')
# TODO: DO SQL HERE AND STORE IT IN A VAR CALLED JSON_QUERY
def states() :
    json_query = [{
            "id": "texas",
            "name":"Texas",
            "capital":"Austin",
            "abbreviation":"TX",
            "flower":"Bluebonnet",
            "media":"/static/img/texasflag.png",
            "brewery":"Pinthouse Pizza",
            "brewery_id": "pinthouse_pizza",
            "venue":"Craft Pride",
            "venue_id":"craft_pride"
        }, {
            "id": "new_york",
            "name":"New York",
            "capital":"Albany",
            "abbreviation":"NY",
            "flower":"Rose",
            "media":"/static/img/newyorkflag.png",
            "brewery":"Other Half Brewing Company",
            "brewery_id": "other_half_brewing_company",
            "venue":"Rattle N Hum",
            "venue_id":"rattle_n_hum"
        }, {
            "id" : "oregon",
            "name":"Oregon",
            "capital":"Salem",
            "abbreviation":"OR",
            "flower":"Oregon Grape",
            "media":"/static/img/oregonflag.png",
            "brewery":"El Segundo Brewing Company",
            "brewery_id":"el_segundo_brewing_company",
            "venue":"The BeerMongers",
            "venue_id":"the_beermongers"
        }]
    return render_template('states.html', json_query = json_query)

# Page that shows info about a specific location with
# the name of the location being passed in 
@app.route('/states/<state_name>/')
def state(state_name) :
    state_info = [{
            "id": "texas",
            "name":"Texas",
            "capital":"Austin",
            "abbreviation":"TX",
            "flower":"Bluebonnet",
            "media":"/static/img/texasflag.png",
            "brewery":"Pinthouse Pizza",
            "brewery_id": "pinthouse_pizza",
            "venue":"Craft Pride",
            "venue_id":"craft_pride"
        }, {
            "id": "new_york",
            "name":"New York",
            "capital":"Albany",
            "abbreviation":"NY",
            "flower":"Rose",
            "media":"/static/img/newyorkflag.png",
            "brewery":"Other Half Brewing Company",
            "brewery_id": "other_half_brewing_company",
            "venue":"Rattle N Hum",
            "venue_id":"rattle_n_hum"
        }, {
            "id" : "oregon",
            "name":"Oregon",
            "capital":"Salem",
            "abbreviation":"OR",
            "flower":"Oregon Grape",
            "media":"/static/img/oregonflag.png",
            "brewery":"El Segundo Brewing Company",
            "brewery_id":"el_segundo_brewing_company",
            "venue":"The BeerMongers",
            "venue_id":"the_beermongers"
        }]
    state_info = next((item for item in state_info if item["id"] == state_name), None)

    return render_template('state.html', 
        name = state_name, 
        state_info = state_info)

# API GET methods

# return all beers (names only) in Beer table
@app.route('/api/beers', methods=['GET'])
def get_beers():
    beers = Beer.query.all()
    beer_names = list()
    for beer in beers:
        beer_names += beer.name
    return jsonify({'result' : beer_names})

# return all information on named beer
@app.route('api/beer/<string:name>', methods=['GET'])
def get_beer_info(beer_name):
    beer = Beer.query.filter_by(name=beer_name)

    if not beer:
        abort(404)
    return jsonify({'result' : beer.dictify()})

# return all venues in Venue table
@app.route('/api/venues', methods=['GET'])
def get_venues():
    venues = Venue.query.all()
    venue_names = list()
    for venue in venues:
        venue_names += venue.name
    return jsonify({'result' : venue_names})

# return all information on named venue
@app.route('api/venue/<string:name>', methods=['GET'])
def get_venue_info(venue_name):
    venue = venue.query.filter_by(name=venue_name)

    if not venue:
        abort(404)
    return jsonify({'result' : venue.dictify()})

# return all breweries in Brewery table
@app.route('/api/breweries', methods=['GET'])
def get_breweries():
    breweries = Brewery.query.all()
    brewery_names = list()
    for brewery in breweries:
        brewery_names += brewery.name
    return jsonify({'result' : brewery_names})

# return all information on named brewery
@app.route('api/brewery/<string:name>', methods=['GET'])
def get_brewery_info(brewery_name):
    brewery = Brewery.query.filter_by(name=brewery_name)

    if not brewery:
        abort(404)
    return jsonify({'result' : brewery.dictify()})

# return all states in State table
@app.route('/api/states', methods=['GET'])
def get_states():
    states = State.query.all()
    state_names = list()
    for state in states:
        state_names += state.name
    return jsonify({'result' : state_names})

# return all information on named State
@app.route('api/state/<string:name>', methods=['GET'])
def get_state_info(state_name):
    state = State.query.filter_by(name=state_name)

    if not state:
        abort(404)
    return jsonify({'result' : state.dictify()})






