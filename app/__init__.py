from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
import sensitive

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = sensitive.DATABASE['postgres']
db = SQLAlchemy(app)
db.create_all()

from app import views,models
