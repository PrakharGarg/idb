from flask import render_template
from app import app

# Index page that contains a carousel 
# Can be accessed at either / or /index/
@app.route('/')
@app.route('/index/')
def index() :
    return render_template('index.html')

@app.route('/about/')
def about() :
    return render_template('about.html')

# Page that shows all of the beers in a grid    
@app.route('/beers/')
def beers() :
    return render_template('beers.html')

# Page that shows info about a specific beer with
# the name of the beer being passed in   
@app.route('/beers/<beer_name>/')
def beer(beer_name) :
    beer_info = [{
            "name":"Bearded Seal",
            "labels":"https://untappd.akamaized.net/site/beer_logos/beer-_251610_5e1b7f6c8e4f14e29b5f2144ad7e.jpeg",
            "style":"Stout - Irish Dry",
            "abv":"6.1",
            "rating":"3.80086",
            "isOrganic":"N",
            "brewery":"Pinthouse Pizza",
            "state":"TX"
        }, {
            "name":"Bursted Citra",
            "labels":"https://s3.amazonaws.com/brewerydbapi/beer/ezGh5N/upload_r8SNni-large.png",
            "style":"IPA - American",
            "abv":"6",
            "rating":"3.86842",
            "isOrganic":"N",
            "brewery":"El Segundo Brewing Company",
            "state":"OR"
        }, {
            "name":"Daydream In Green",
            "labels":"https://untappd.akamaized.net/site/beer_logos/beer-1995566_d307c_sm.jpeg",
            "style":"IPA - Imperial / Double",
            "abv":"8.1",
            "rating":"4.44162",
            "isOrganic":"N",
            "brewery":"Other Half Brewing Company",
            "state":"NY"
        }]
    beer = ''
    for b in beer_info:
        if beer_name == b['name']:
            beer = b

    return render_template('beer.html', 
        name = beer_name, 
        brewery = beer["brewery"], 
        state = beer["state"], 
        beer_info = beer)

# Page that shows all of the venues in a grid
@app.route('/venues/')
def venues() :
    return render_template('venues.html')

# Page that shows info about a specific venue with
# the name of the venue being passed in 
@app.route('/venues/<venue_name>/')
def venue(venue_name) :
    venue_info = [{
            "name":"Craft Pride",
            "category":"Nightlife Spot",
            "media":"https://untappd.akamaized.net/photo/2017_03_23/fa1e38c565451d0d57610426ec397a9a_640x640.jpeg",
            "address":"61 Rainey St Austin, TX",
            "is_public":"Yes",
            "beer":"Bearded Seal",
            "brewery":"Pinthouse Pizza",
            "state":"TX"
        }, {
            "name":"Craft Pride",
            "category":"Nightlife Spot",
            "media":"https://untappd.akamaized.net/photo/2017_03_23/fa1e38c565451d0d57610426ec397a9a_640x640.jpeg",
            "address":"61 Rainey St Austin, TX",
            "is_public":"Yes",
            "beer":"Bearded Seal",
            "brewery":"Pinthouse Pizza",
            "state":"TX"
        }, {
            "name":"Craft Pride",
            "category":"Nightlife Spot",
            "media":"https://untappd.akamaized.net/photo/2017_03_23/fa1e38c565451d0d57610426ec397a9a_640x640.jpeg",
            "address":"61 Rainey St Austin, TX",
            "is_public":"Yes",
            "beer":"Bearded Seal",
            "brewery":"Pinthouse Pizza",
            "state":"TX"
        }]
    venue = ''
    for b in venue_info:
        if venue_name == b['name']:
            venue = b

    return render_template('venue.html', 
        name = venue_name, 
        state = venue["state"],
        beer = venue["beer"],
        brewery = venue["brewery"], 
        venue_info = venue)

# Page that shows all of the breweries in a grid
@app.route('/breweries/')
def breweries() :
    return render_template('breweries.html')
    
# Page that shows info about a specific brewery with
# the name of the brewery being passed in 
@app.route('/breweries/<brewery_name>/')
def brewery(brewery_name) :
    return render_template('brewery.html', name = brewery_name)

# Page that shows all of the locations in a grid
@app.route('/states/')
def locations() :
    return render_template('states.html')

# Page that shows info about a specific location with
# the name of the location being passed in 
@app.route('/states/<state_name>/')
def location(state_name) :
    return render_template('state.html', name = state_name)