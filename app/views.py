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
            "name":"Rattle N Hum",
            "category":"Nightlife Spot",
            "media":"https://untappd.akamaized.net/photo/2017_03_22/c0bdf6ce5df2fe33d4ccffdd35497bc0_640x640.jpg",
            "address":"14 E 33rd Street New York, NY",
            "is_public":"Yes",
            "beer":"Daydream In Green",
            "brewery":"Other Half Brewing Company",
            "state":"NY"
        }, {
            "name":"The BeerMongers",
            "category":"Nightlife Spot",
            "media":"https://untappd.akamaized.net/venuelogos/venue_8350_220bb816_bg_88.png",
            "address":"1125 SE Division St Portland, OR",
            "is_public":"Yes",
            "beer":"Bursted Citra",
            "brewery":"El Segundo Brewing Company",
            "state":"OR"
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
    brewery_info = [{
            "name":"El Segundo Brewing Company",
            "type":"Micro Brewery",
            "founded":"2011",
            "label":"https:\/\/untappd.akamaized.net\/site\/brewery_logos\/brewery-11688_fbaaa.jpeg",
            "address":"140 Main St El Segundo, CA",
            "beer":"Bursted Citra",
            "venue":"The BeerMongers",
            "state":"TX"
        }, {
            "name":"Other Half Brewing Company",
            "type":"Micro Brewery",
            "founded":"2014",
            "label":"https://untappd.akamaized.net/site/brewery_logos/brewery-OtherHalfBrewing_94785_7c587.jpeg",
            "address":"195 Centre St Brooklyn, NY",
            "beer":"Daydream In Green",
            "venue":"Rattle N Hum",
            "state":"NY"
        }, {
            "name":"Pinthouse Pizza",
            "type":"Brew Pub",
            "founded":"2012",
            "label":"https:\/\/untappd.akamaized.net\/site\/brewery_logos\/brewery-pinthousepizza_43305.jpeg",
            "address":"4729 Burnet Rd Austin, TX",
            "beer":"Bearded Seal",
            "venue":"Craft Pride",
            "state":"TX"
        }]
    brewery = ''
    for b in brewery_info:
        if brewery_name == b['name']:
            brewery = b

    return render_template('brewery.html', 
        name = brewery_name, 
        state = brewery["state"],
        beer = brewery["beer"],
        venue = brewery["venue"], 
        brewery_info = brewery)

# Page that shows all of the locations in a grid
@app.route('/states/')
def locations() :
    return render_template('states.html')

# Page that shows info about a specific location with
# the name of the location being passed in 
@app.route('/states/<state_name>/')
def location(state_name) :
    state_info = [{
            "name":"Texas",
            "capital":"Austin",
            "abbreviation":"TX",
            "flower":"Bluebonnet",
            "media":"/static/img/texasflag.png",
            "brewery":"Pinthouse Pizza",
            "venue":"Craft Pride"
        }, {
            "name":"New York",
            "capital":"Albany",
            "abbreviation":"NY",
            "flower":"Rose",
            "media":"/static/img/newyorkflag.png",
            "brewery":"Other Half Brewing Company",
            "venue":"Rattle N Hum"
        }, {
            "name":"Oregon",
            "capital":"Salem",
            "abbreviation":"OR",
            "flower":"Oregon Grape",
            "media":"/static/img/oregonflag.png",
            "brewery":"El Segundo Brewing Company",
            "venue":"The BeerMongers"
        }]
    state = ''
    for b in state_info:
        if state_name == b['name']:
            state = b

    return render_template('state.html', 
        name = state_name, 
        brewery = state["brewery"],
        venue = state["venue"], 
        state_info = state)
    return render_template('state.html', name = state_name)