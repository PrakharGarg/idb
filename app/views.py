from flask import render_template
from app import app

# Index page that contains a carousel 
@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')