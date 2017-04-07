
try:
    from app import db
except:
    from __init__ import *

from flask_sqlalchemy import SQLAlchemy
import json

"""
association tables
"""

# venues <-> beers
ven2beer = db.Table('ven2beer',
    db.Column('venue_id', db.Integer, db.ForeignKey('venue.id')),
    db.Column('beer_id', db.Integer, db.ForeignKey('beer.id')),
    extend_existing=True
)  #pragma: no cover

# venues <-> breweries
ven2brew = db.Table('ven2brew',
    db.Column('brewery_id', db.Integer, db.ForeignKey('brewery.id')),
    db.Column('venue_id', db.Integer, db.ForeignKey('venue.id')),
    extend_existing=True
) #pragma: no cover


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
    state_id = db.Column(db.String(120), db.ForeignKey('state.abbreviation')) #pragma: no cover
    brewery_id = db.Column(db.Integer, db.ForeignKey('brewery.id')) #pragma: no cover
    style = db.Column(db.String(60), index=True) #pragma: no cover
    rating = db.Column(db.Float) #pragma: no cover
    name = db.Column(db.String(120), index=True) #pragma: no cover
    label = db.Column(db.String(300), index=True) #pragma: no cover
    id = db.Column(db.Integer, primary_key=True) #pragma: no cover
    ibu = db.Column(db.Integer) #pragma: no cover
    abv = db.Column(db.Float) #pragma: no cover
    __table_args__ = {'extend_existing': True}  #pragma: no cover
    
    def __init__(self, idd, style, rating, name, label, abv, ibu) :
        assert (style != "")
        assert (rating != "")
        assert (name != "")
        assert (label != "")
        assert (abv != "")
        assert (ibu != "")
        
        self.id = idd
        self.style = style
        self.rating = rating
        self.name = name
        self.label = label
        self.abv = abv
        self.ibu = ibu

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
    address = db.Column(db.String(120), index=True, unique=True) #pragma: no cover
    name = db.Column(db.String(120), index=True, unique=True) #pragma: no cover
    founded = db.Column(db.Float, index=True) #pragma: no cover
    label = db.Column(db.String(300), index=True, unique=True) #pragma: no cover
    brewery_type = db.Column(db.String(60), index=True) #pragma: no cover
    id = db.Column(db.Integer, primary_key=True) #pragma: no cover
    # relationships
    state_id = db.Column(db.String(120), db.ForeignKey('state.abbreviation')) #pragma: no cover
    beers = db.relationship('Beer', backref='brewery', lazy='select') #pragma: no cover
    __table_args__ = {'extend_existing': True}  #pragma: no cover
    
    def __init__(self, address, name, founded, label, brewery_type) :
        assert (address != "")
        assert (name != "")
        assert (founded != "")
        assert (label != "")
        assert (brewery_type != "")
        
        self.address = address
        self.founded = founded
        self.name = name
        self.label = label
        self.brewery_type = brewery_type

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
    category = db.Column(db.String(90), index=True) #pragma: no cover
    id = db.Column(db.Integer, primary_key=True) #pragma: no cover
    media = db.Column(db.String(300), index=True) #pragma: no cover
    is_public = db.Column(db.Boolean) #pragma: no cover
    name = db.Column(db.String(120), index=True) #pragma: no cover
    address = db.Column(db.String(120), index=True) #pragma: no cover
    # relationships
    state_id = db.Column(db.String(120), db.ForeignKey('state.abbreviation')) #pragma: no cover
    ven2beer = db.relationship('Beer',
        secondary=ven2beer,
        backref=db.backref('venues'),
        lazy='select') #pragma: no cover
    ven2brew = db.relationship('Brewery',
        secondary=ven2brew,
        backref=db.backref('venues'),
        lazy='select') #pragma: no cover

    __table_args__ = {'extend_existing': True}  #pragma: no cover
        
    def __init__(self, category, media, is_public, name, address) :
        assert (address != "")
        assert (name != "")
        assert (category != "")
        assert (media != "")
        assert (is_public != "")
        
        self.address = address
        self.category = category
        self.name = name
        self.media = media
        self.is_public = is_public

    def __repr__(self):
        """
        get a string representation of this venue
        """
        return json.dumps(self.to_dict())

    def to_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

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
    abbreviation = db.Column(db.String(120), index=True, unique=True, primary_key=True) #pragma: no cover
    capital = db.Column(db.String(120), index=True, unique=True) #pragma: no cover
    name = db.Column(db.String(120), index=True, unique=True) #pragma: no cover
    media = db.Column(db.String(300), index=True, unique=True) #pragma: no cover
    flower = db.Column(db.String(120), index=True) #pragma: no cover
    #relationships
    breweries = db.relationship('Brewery', backref='state', lazy='select') #pragma: no cover
    venues = db.relationship('Venue', backref='state', lazy='select') #pragma: no cover
    beers = db.relationship('Beer', backref='state', lazy='select') #pragma: no cover
    __table_args__ = {'extend_existing': True}  #pragma: no cover
    
    def __init__(self, abbreviation, capital, name, media, flower) :
        assert (abbreviation != "")
        assert (capital != "")
        assert (name != "")
        assert (media != "")
        assert (flower != "")
        
        self.capital = capital
        self.abbreviation = abbreviation
        self.name = name
        self.media = media
        self.flower = flower

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
        return self.abbreviation == "TX"

    def is_flower_pretty(self):
        """
        get info back on this state's flower's prettiness
        """
        return True
