# pylint: disable = bad-whitespace
# pylint: disable = invalid-name
# pylint: disable = missing-docstring
import unittest

try:
    from app import db
    from app.models import *
except:
    from __init__ import db
    from models import *

class TestModels(unittest.TestCase):
        
    def setUp(self):
        db.drop_all()
        db.session.remove()
        db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()
        
    global demo_beer
    demo_beer = {
        'id':0,
        'name':"Shiner Bock",
        'label':"https://www.beermenus.com/beers/4728-shiner-bock/label",
        'style':"lager",
        'ibu':24,
        'abv':7.6,
        'rating':3.2
    }

    global demo_brewery
    demo_brewery = {
        'address':"1809 Rio Grande St.",
        'founded':2003,
        'name':"Austin Brewery",
        'label':"https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html",
        'brewery_type':"lager"
    }

    global demo_state
    demo_state = {
        'capital':"Austin",
        'abbreviation':"TX",
        'name':"Texas",
        'media':"https://en.wikipedia.org/wiki/Flag_of_Texas#/media/File:Flag_of_Texas.svg",
        'flower':"Bluebonnet"
    }

    def test_beer(self):
        beer = Beer(
            idd=0,
            name="Shiner Bock",
            label="https://www.beermenus.com/beers/4728-shiner-bock/label",
            style="lager",
            ibu=24,
            abv=7.6,
            rating=3.2
            )
        db.session.add(beer)
        db.session.commit()
        beers = Beer.query.all()
        self.assertTrue(str(beer) in [str(b) for b in beers])

    def test_beer_dict(self):
        beer = Beer(
            idd=0,
            name="Shiner Bock",
            label="https://www.beermenus.com/beers/4728-shiner-bock/label",
            style="lager",
            ibu=24,
            abv=7.6,
            rating=3.2
            )
        for key in beer.to_dict():
            self.assertEqual(beer.to_dict().get(key), demo_beer.get(key))

    def test_beer_label(self):
        beer = Beer(
            idd=0,
            name="Shiner Bock",
            label="https://www.beermenus.com/beers/4728-shiner-bock/label",
            style="lager",
            ibu=24,
            abv=7.6,
            rating=3.2
            )
        beer.relabel("https://www.bluemoon.com/beers/4728-blue-moon/label")
        self.assertEqual(beer.label,"https://www.bluemoon.com/beers/4728-blue-moon/label")

    def test_beer_rating(self):
        beer = Beer(
            idd=0,
            name="Shiner Bock",
            label="https://www.beermenus.com/beers/4728-shiner-bock/label",
            style="lager",
            ibu=24,
            abv=7.6,
            rating=3.2
            )
        beer.change_rating(9)
        self.assertEqual(beer.rating,9)

    def test_brewery(self):
        brewery = Brewery(
            address="1809 Rio Grande St.",
            founded=2003,
            name="Austin Brewery",
            label="https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html",
            brewery_type="lager")
        db.session.add(brewery)
        db.session.commit()
        breweries = Brewery.query.all()
        self.assertTrue(str(brewery) in [str(b) for b in breweries])

    def test_brewery_dict(self):
        brewery = Brewery(
            address="1809 Rio Grande St.",
            founded=2003,
            name="Austin Brewery",
            label="https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html",
            brewery_type="lager")
        for key in brewery.to_dict():
            self.assertEqual(brewery.to_dict().get(key),demo_brewery.get(key))

    def test_brewery_name(self):
        brewery = Brewery(
            address="1809 Rio Grande St.",
            founded=2003,
            name="Austin Brewery",
            label="https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html",
            brewery_type="lager")
        brewery.change_name("Bud Light")
        self.assertEqual(str(brewery.name), "Bud Light")

    def test_brewery_date(self):
        brewery = Brewery(
            address="1809 Rio Grande St.",
            founded=2003,
            name="Austin Brewery",
            label="https://www.tripadvisor.com/LocationPhotoDirectLink-g30196-d8547104-i232510009-Hops_Grain_Brewing-Austin_Texas.html",
            brewery_type="lager")
        with self.assertRaises(Exception):
            brewery.change_date_founded(2004)

    def test_venue(self):
        venue = Venue(
            address="301 Lavaca St.",
            category="pub",
            name="The Ginger Man",
            media="https://www.facebook.com/pg/Draughthouse/photos/",
            is_public=True)
        db.session.add(venue)
        db.session.commit()
        venues = Venue.query.all()
        self.assertTrue(str(venue) in [str(v) for v in venues])

    def test_state(self):
        state = State(
            capital="Austin",
            abbreviation="TX",
            name="Texas",
            media="https://en.wikipedia.org/wiki/Flag_of_Texas#/media/File:Flag_of_Texas.svg",
            flower="Bluebonnet")
        db.session.add(state)
        db.session.commit()
        states = State.query.all()
        self.assertTrue(str(state) in [str(s) for s in states])

    def test_state_dict(self):
        state = State(
            capital="Austin",
            abbreviation="TX",
            name="Texas",
            media="https://en.wikipedia.org/wiki/Flag_of_Texas#/media/File:Flag_of_Texas.svg",
            flower="Bluebonnet")
        for key in state.to_dict():
            self.assertEqual(state.to_dict().get(key), demo_state.get(key))

    def test_state_best(self):
        state = State(
            capital="Austin",
            abbreviation="TX",
            name="Texas",
            media="https://en.wikipedia.org/wiki/Flag_of_Texas#/media/File:Flag_of_Texas.svg",
            flower="Bluebonnet")
        state.abbreviation=state.is_best_state()
        self.assertTrue(state.abbreviation)

    def test_state_pretty(self):
        state = State(
            capital="Austin",
            abbreviation="TX",
            name="Texas",
            media="https://en.wikipedia.org/wiki/Flag_of_Texas#/media/File:Flag_of_Texas.svg",
            flower="Bluebonnet")
        self.assertTrue(state.is_flower_pretty())

if __name__ == "__main__" : #pragma: no cover
    unittest.main()

