# pylint: disable = bad-whitespace
# pylint: disable = invalid-name
# pylint: disable = missing-docstring
import unittest

from app import db
from app.models import *

class TestModels(unittest.TestCase):
        
    def setUp(self):
        db.drop_all()
        db.session.remove()
        db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()
        
    def test_beer(self):
        beer = Beer(
            idd="0",
            name="Shiner Bock",
            label="https://www.beermenus.com/beers/4728-shiner-bock/label",
            style="lager",
            ibu=24,
            abv=7.6,
            rating=3.2)
        db.session.add(beer)
        db.session.commit()
        beers = Beer.query.all()
        self.assertTrue(str(beer) in [str(b) for b in beers])
        
    