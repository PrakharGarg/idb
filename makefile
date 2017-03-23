clean:
	-rm -r *.pyc
	-rm -rf idb-env

run:
	python main.py

deploy:
	gcloud deploy app

env:
	sudo pip install virtualenv
	virtualenv idb-env
	-source idb-env/bin/activate
	pip install -r requirements.txt

test:
	
	


