from app import db

from flask_sqlalchemy import SQLAlchemy
import json

"""
association tables
"""

# venues <-> beers
ven2beer = db.Table('ven2beer',
    db.Column('venue_id', db.Integer, db.ForeignKey('venue.id')),
    db.Column('beer_id', db.Integer, db.ForeignKey('beer.id'))
)

# venues <-> breweries
ven2brew = db.Table('ven2brew',
    db.Column('venue_id', db.Integer, db.ForeignKey('venue.id')),
    db.Column('brewery_id', db.Integer, db.ForeignKey('brewery.id'))
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
    state_id = db.Column(db.String(120), db.ForeignKey('state.abbreviation'))
    brewery_id = db.Column(db.Integer, db.ForeignKey('brewery.id'))
    style = db.Column(db.String(60), index=True)
    rating = db.Column(db.Float)
    name = db.Column(db.String(120), index=True)
    label = db.Column(db.String(300), index=True)
    id = db.Column(db.Integer, primary_key=True)
    ibu = db.Column(db.Integer)
    abv = db.Column(db.Float)
    # relationships

    def __repr__(self):
        """
        get a string representation of this beer
        """
        return json.dumps(self.to_dict())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

    def relabel(self, new_label):
        """
        change the label on this beer (gotta keep it fresh!)
        """
        self.label = new_label

    def change_rating(self, new_rating):
        """
        update the rating on this beer
        """
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
    # properties
    address = db.Column(db.String(120), index=True, unique=True)
    name = db.Column(db.String(120), index=True, unique=True)
    founded = db.Column(db.Float, index=True)
    label = db.Column(db.String(300), index=True, unique=True)
    brewery_type = db.Column(db.String(60), index=True)
    id = db.Column(db.Integer, primary_key=True)
    # relationships
    state_id = db.Column(db.String(120), db.ForeignKey('state.abbreviation'))
    beers = db.relationship('Beer', backref='brewery', lazy='select')

    def __repr__(self):
        """
        get a string representation of this brewery
        """
        return json.dumps(self.to_dict())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

    def change_name(self, new_name):
        """
        change this brewery's name
        """
        self.name = new_name

    def change_founded_date(self, new_date):
        """
        Rewrite history! Lie! Try, at least :)
        """
        raise Exception('THOU SHALT NOT REWRITE HISTORY')

    def add_venue(self, venue):
        """
        add a venue to which this brewery distributes its products
        """
        self.venues.add(venue)

    def remove_venue(self, venue):
        """
        stop distributing beer to a venue
        """
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
    # properties
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(120), index=True, unique=True)
    media = db.Column(db.String(300), index=True, unique=True)
    address = db.Column(db.String(120), index=True, unique=True)
    category = db.Column(db.String(90), index=True, unique=True)
    is_public = db.Column(db.Boolean)
    # relationships
    state_id = db.Column(db.String(120), db.ForeignKey('state.abbreviation'))
    ven2beer = db.relationship('Beer',
        secondary=ven2beer,
        backref=db.backref('venues'),
        lazy='select')
    ven2brew = db.relationship('Brewery',
        secondary=ven2brew,
        backref=db.backref('venues'),
        lazy='select')

    def __repr__(self):
        """
        get a string representation of this venue
        """
        return json.dumps(self.to_dict())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

    def add_beer(self, beer):
        """
        add a beer that this venue will serve
        """
        self.beers.add(beer)

    def remove_beer(self, beer):
        """
        stop serving a beer
        """
        self.beers.remove(beer)

    def remove_brewery(self, brewery):
        """
        stop serving all beers from this brewery
        """
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
    #properties
    abbreviation = db.Column(db.String(120), index=True, unique=True, primary_key=True)
    capital = db.Column(db.String(120), index=True, unique=True)
    name = db.Column(db.String(120), index=True, unique=True)
    media = db.Column(db.String(300), index=True, unique=True)
    flower = db.Column(db.String(120), index=True)
    #relationships
    breweries = db.relationship('Brewery', backref='state', lazy='select')
    venues = db.relationship('Venue', backref='state', lazy='select')
    beers = db.relationship('Beer', backref='state', lazy='select')

    def __repr__(self):
        """
        get a string representation of this state
        """
        return json.dumps(self.to_dict())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

    def is_best_state(self):
        """
        get whether or not this state is the best in the US
        """
        return abbreviation == 'TX'

    def add_media(self, link):
        """
        add an image that helps showcase this state
        """
        self.media.add(media)

    def is_flower_pretty(self):
        """
        get info back on this state's flower's prettiness
        """
        return True
