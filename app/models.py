from app import db

venue_brewery_association = db.Table('venue_brewery_association',
    db.Column('brewery_id', db.Integer, db.ForeignKey('brewery.id')),
    db.Column('venue_id', db.Integer, db.ForeignKey('venue.id'))
)

venue_beer_association = db.Table('venue_beer_association',
    db.Column('venue_id', db.Integer, db.ForeignKey('venue.id')),
    db.Column('beer_id', db.Integer, db.ForeignKey('beer.id'))
)

class Beer(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(120), index=True, unique=True)
	labels = db.Column(db.Array(db.String(300)), index=True, unique=True)
	style = db.Column(db.String(60), index=True, unique=True)
	is_organic = db.Column(db.Boolean)
	glassware = db.Column(db.Array(db.String(300)), index=True, unique=True)
	brewery = db.relationship('Brewery')
	venues = db.relationship('Venue', secondary=venue_beer_association)

class Brewery(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(120), index=True, unique=True)
	brewery_type = db.Column(db.String(60), index=True, unique=True)
	founded = db.Column(db.Date)
	labels = db.Column(db.Array(db.String(300)), index=True, unique=True)
	address = db.Column(db.String(120), index=True, unique=True)
	venues = db.relationship('Venue', secondary=venue_brewery_association)
	state = db.relationship('State')

class Venue(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(120), index=True, unique=True)
	media = db.Column(db.Array(db.String(300)), index=True, unique=True)
	address = db.Column(db.String(120), index=True, unique=True)
	category = db.Column(db.String(90), index=True, unique=True)
	state = db.relationship('State')
	breweries = db.relationship('Brewery', secondary=venue_brewery_association)
	beers = db.relationship('Beer', secondary=venue_beer_association)


class State(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	capital = db.Column(db.String(120), index=True, unique=True)
	name = db.Column(db.String(120), index=True, unique=True)
	media = db.Column(db.Array(db.String(300)), index=True, unique=True)

