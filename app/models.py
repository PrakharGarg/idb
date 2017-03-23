from app import db

"""
association tables for many-to-many relationships
"""
venue_brewery_association = db.Table('venue_brewery_association',
    db.Column('brewery_id', db.Integer, db.ForeignKey('brewery.id')),
    db.Column('venue_id', db.Integer, db.ForeignKey('venue.id'))
)

venue_beer_association = db.Table('venue_beer_association',
    db.Column('venue_id', db.Integer, db.ForeignKey('venue.id')),
    db.Column('beer_id', db.Integer, db.ForeignKey('beer.id'))
)

"""
model definitions
"""
class Beer(db.Model):
	"""
	This is the beer model. It contains the necessary information and links
	for serving up all you could ever want to know about a tasty brew.

	Attributes:
		name: name of the beer
		labels: link to a picture of the beer label
		style: what type of beer this is (ale, lager, IPA, kolsh, etc.)
		is_organic: whether or not this beer is environmentally friendly!
        rating: numeric rating by the Untapped community.
		brewery: where and who this is brewed by 
		venues: where this beer is served, sold, and distributed
	"""
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(120), index=True, unique=True)
	labels = db.Column(db.Array(db.String(300)), index=True, unique=True)
	style = db.Column(db.String(60), index=True, unique=True)
	is_organic = db.Column(db.Boolean)
    rating = db.Column(db.Integer)
	brewery = db.relationship('Brewery')
	venues = db.relationship('Venue', secondary=venue_beer_association)

	def __init__(self, name, labels, style, is_organic, rating,
		brewery, venues):
		self.name = name
		self.labels = labels
		self.style = style
		self.is_organic = is_organic
		self.rating = rating
		self.brewery = brewery
		self.venues = venues

	def __repr__(self):
		descr = "This is {} beer. You will drink it, and you will love it!"
		return descr.format(self.name)

	def relabel(self, new_label):
		self.labels.insert(0, new_label)

	def change_rating(self, new_rating):
		self.rating = new_rating

class Brewery(db.Model):
	"""
	The brewery model. This gives information about what kinds of beers
	are crafted here, what kind of brewery tis is, and where it's located.

	Attributes:
		name: name of this brewery
		brewery_type: large, medium, craft, micro, etc.
		founded: date this brewery was created
		labels: links to images of this breweries logo
		address: where this thing is!
		venues: who serves, sells, and distributes this beer
		state: which state this exists in
	"""
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(120), index=True, unique=True)
	brewery_type = db.Column(db.String(60), index=True, unique=True)
	founded = db.Column(db.Date)
	labels = db.Column(db.Array(db.String(300)), index=True, unique=True)
	address = db.Column(db.String(120), index=True, unique=True)
	venues = db.relationship('Venue', secondary=venue_brewery_association)
	state = db.relationship('State')

	def __init__(self, name, brewery_type, founded, labels, address,
		venues, state):
		self.name = name
		self.brewery_type = brewery_type
		self.founded = founded
		self.labels = labels
		self.address = address
		self.venues = venues
		self.state = state

	def __repr__(self):
		descr = "At {}, we brew lots of beers. Try some!"
		return descr.format(self.name)

	def change_name(self, new_name):
		self.name = new_name

	def change_founded_date(self, new_date):
		raise Exception('THOU SHALT NOT REWRITE HISTORY')

	def add_venue(self, venue):
		self.venues.add(venue)

	def remove_venue(self, venue):
		self.venues.remove(venue)

class Venue(db.Model):
	"""
	The venue model. You come here to visit with friends, 
	enjoy a pint of your favorite brew, and to find 
	new favorites! This has all the info you need. For
	bars, restaurants, stores, and anywhere else you can get
	your hands on a can, bottle, or pint.

	Attributes:
		name: its name
		media: links to images of the venue, its patrons, its logo, etc.
		address: where this is located
		category: is this a bar? is it a store? this will tell you!
        is_public: boolean value to let us know if this place is open to the public or not.
		state: which state you will find this in
		breweries: all of the breweries represented here
		beers: all the beers you may obtain
	"""
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(120), index=True, unique=True)
	media = db.Column(db.Array(db.String(300)), index=True, unique=True)
	address = db.Column(db.String(120), index=True, unique=True)
	category = db.Column(db.String(90), index=True, unique=True)
    is_public = db.Column(db.Boolean)
	state = db.relationship('State')
	breweries = db.relationship('Brewery', secondary=venue_brewery_association)
	beers = db.relationship('Beer', secondary=venue_beer_association)

	def __init__(self, name, media, address, category, is_public,
		state, breweries, beers):
		self.name = name
		self.media = media
		self.address = address
		self.category = category
		self.is_public = is_public
		self.state = state
		self.breweries = breweries
		self.beers = beers

	def __repr__(self):
		descr = "Here at {}, you can get a whole bunch of beers from {} breweries."
		return descr.format(self.name, str(len(self.breweries)))

	def add_beer(self, beer):
		self.beers.add(beer)

	def remove_beer(self, beer):
		self.beers.remove(beer)

	def remove_brewery(self, brewery):
		self.breweries.remove(brewery)
		self.beers = [br for br in self.beers if br.brewery != brewery]

class State(db.Model):
	"""
	A large geographic region you may wish to explore by beer. Beer!
	States contain information about venues and breweries located in them,
	and some general trivia you may find amusing.

	Attributes:
		name: what state is this?
		capital: the city where this state does its legislative business
		media: links to pics of this state!
        abbreviation: state abbreviation.
        flower: the state flower! 
	"""
	id = db.Column(db.Integer, primary_key=True)
	capital = db.Column(db.String(120), index=True, unique=True)
	name = db.Column(db.String(120), index=True, unique=True)
	media = db.Column(db.Array(db.String(300)), index=True, unique=True)
    abbreviation = db.Column(db.String(120), index=True, unique=True)
    flower = db.Column(db.String(120), index=True, unique=True)

    def __init__(self, capital, name, media, abbreviation, flower):
    	self.capital = capital
    	self.name = name
    	self.media = media
    	self.abbreviation = abbreviation
    	self.flower = flower

	def __repr__(self):
		descr = ("Welcome to {}, where the state flower is the {}, and "
			"the capital is {}. Our postal code is {}!")
		return descr.format(self.name, self.flower, self.capital, self.abbreviation)

	def is_best_state(self):
		return abbreviation == 'TX'

	def add_media(self, link):
		self.media.add(media)

	def is_flower_pretty(self):
		return True
