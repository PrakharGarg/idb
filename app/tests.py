#!/usr/bin/env python3

# pylint: disable = bad-whitespace
# pylint: disable = invalid-name
# pylint: disable = missing-docstring

import os
import unittest

from app import app, db
from app.models import Beer, Brewery, Venue, State

class TestModels(TestCase):

	def setUp(self):
        app.config['TESTING'] = True
        app.config['WTF_CSRF_ENABLED'] = False
        app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'test.db')
        self.app = app.test_client()
        db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()
        
    def test_beer(self):
    	beer = Beer("0", "Shiner Bock", "https://www.beermenus.com/beers/4728-shiner-bock/label", "lager", "false", "Spoetzl Brewery", "Westwood's Liquor, A&J")
    	db.session.add(beer)
    	db.session.commit()
    	beers = Beer.query.all()
    	self.assertTrue(beer in beers)
    	
    def test_beer2(self):
    	beer = Beer("1", "Blue Moon", "https://www.bluemoon.com/beers/4728-blue-moon/label", "lager", "false", "Spoetzl Brewery", "HEB")
    	db.session.add(beer)
    	db.session.commit()
    	beers = Beer.query.all()
    	self.assertTrue(beer in beers)
    	
    def test_beer3(self):
    	beer = Beer("2", "Heineken", "https://www.heineken.com/beers/4728-heineken/label", "lager", "false", "Spoetzl Brewery", "Westwood's Liquor, A&J")
    	db.session.add(beer)
    	db.session.commit()
    	beers = Beer.query.all()
    	self.assertTrue(beer in beers)
    	
    def test_beer4(self):
    	beer = Beer("3", "Bud Light", "https://www.budlight.com/beers/4728-budlight/label", "lager", "false", "Spoetzl Brewery", "Westwood's Liquor, A&J")
    	db.session.add(beer)
    	db.session.commit()
    	beers = Beer.query.all()
    	self.assertTrue(beer in beers)

    	
    def test_brewery(self):
    	brewery = Brewery("0", "Hops and Grain", "micro", "2011", "https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html", "507 Calles St, Suite 101, Austin, TX 78702", "Diamond Food Mart, Westwood's Liquor" "Texas"
    	db.session.add(brewery)
    	db.session.commit()
    	breweries = Brewery.query.all()
    	self.assertTrue(brewery in breweries)
    	
    def test_brewery2(self):
    	brewery = Brewery("1", "Blue Owl", "medium", "2010", "https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html", "507 Calles St, Suite 101, Austin, TX 78702", "HEB" "Texas"
    	db.session.add(brewery)
    	db.session.commit()
    	breweries = Brewery.query.all()
    	self.assertTrue(brewery in breweries)
    	
    def test_brewery3(self):
    	brewery = Brewery("2", "Zilker Brewing Company and Taproom", "micro", "2011", "https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html", "507 Calles St, Suite 101, Austin, TX 78702", "Diamond Food Mart, Westwood's Liquor" "Texas"
    	db.session.add(brewery)
    	db.session.commit()
    	breweries = Brewery.query.all()
    	self.assertTrue(brewery in breweries)
    	
    def test_brewery4(self):
    	brewery = Brewery("3", "Pinthouse Pizza", "large", "2002", "https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html", "507 Calles St, Suite 101, Austin, TX 78702", "Diamond Food Mart, Westwood's Liquor" "Texas"
    	db.session.add(brewery)
    	db.session.commit()
    	breweries = Brewery.query.all()
    	self.assertTrue(brewery in breweries)

    def test_venue(self):
    	venue = Venue("0", "The Ginger Man", "https://www.facebook.com/pg/TheGingerManAustin/photos/", "301 Lavaca St.", "pub", "true", "Texas", "Spoetzl, Uncle Billy's", "Shiner Bock, Dos Equis, Budweiser"
    	db.session.add(venue)
    	db.session.commit()
    	venues = Venue.query.all()
    	self.assertTrue(venue in venues)
    	
    def test_venue2(self):
    	venue = Venue("1", "Draught House Pub", "https://www.facebook.com/pg/Draughthouse/photos/", "879 Norther St.", "bar", "true", "Texas", "Spoetzl, Uncle Billy's", "Bud Light, Budweiser"
    	db.session.add(venue)
    	db.session.commit()
    	venues = Venue.query.all()
    	self.assertTrue(venue in venues)
    	
    def test_venue3(self):
    	venue = Venue("2", "Craft Pride", "https://www.facebook.com/pg/craftpride/photos/", "3192 W Av", "pub", "true", "Florida", "Spoetzl, Uncle Billy's", "Heineken, Dos Equis, Budweiser"
    	db.session.add(venue)
    	db.session.commit()
    	venues = Venue.query.all()
    	self.assertTrue(venue in venues)
    	
    def test_venue4(self):
    	venue = Venue("3", "Easy Tiger", "https://www.facebook.com/pg/easytiger/photos/", "888 N St.", "pub", "true", "Florida", "Spoetzl, Uncle Billy's", "Heineken, Dos Equis, Budweiser"
    	db.session.add(venue)
    	db.session.commit()
    	venues = Venue.query.all()
    	self.assertTrue(venue in venues)

    def test_state(self):
    	state = State("0", "Austin", "Texas", "https://en.wikipedia.org/wiki/Flag_of_Texas#/media/File:Flag_of_Texas.svg", "TX", "Bluebonnet"
    	db.session.add(state)
    	db.session.commit()
    	states = State.query.all()
    	self.assertTrue(state in states)
    	
    def test_state2(self):
    	state = State("1", "Tallahassee", "Florida", "https://en.wikipedia.org/wiki/Flag_of_Texas#/media/File:Flag_of_Florida.svg", "FL", "Orange Blossom"
    	db.session.add(state)
    	db.session.commit()
    	states = State.query.all()
    	self.assertTrue(state in states)
    	
    def test_state3(self):
    	state = State("2", "Atlanta", "Georgia", "https://en.wikipedia.org/wiki/Flag_of_Texas#/media/File:Flag_of_Georgia.svg", "GA", "Rosa laevigata"
    	db.session.add(state)
    	db.session.commit()
    	states = State.query.all()
    	self.assertTrue(state in states)
    	
if __name__ == "__main__":
	unittest.main()