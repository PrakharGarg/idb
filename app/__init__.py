from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from flask.ext.triangle import Triangle


app = Flask(__name__)
Triangle(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://localhost/poh'
db = SQLAlchemy(app)

from app import views, models
