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
    return render_template('beer.html', name = beer_name)

# Page that shows all of the venues in a grid
@app.route('/venues/')
def venues() :
    return render_template('venues.html')

# Page that shows info about a specific venue with
# the name of the venue being passed in 
@app.route('/venues/<venue_name>/')
def venue(venue_name) :
    return render_template('venue.html', name = venue_name)
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
@app.route('/locations/')
def locations() :
    return render_template('locations.html')

# Page that shows info about a specific location with
# the name of the location being passed in 
@app.route('/locations/<location_name>/')
def location(location_name) :
    return render_template('location.html', name = location_name)