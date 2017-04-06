FILES :=                          	\
    main.py                       	\
	app/__init__.py					\
	app/models.py					\
	app/tests.py					\
	app/views.py					\
	app/templates/about.html		\
	app/templates/base.html			\
	app/templates/beer.html			\
	app/templates/beers.html		\
	app/templates/breweries.html	\
	app/templates/brewery.html		\
	app/templates/index.html		\
	app/templates/states.html		\
	app/templates/venues.html		\
	app/templates/venue.html		\
	.gitignore                    	\
	requirements.txt				\


check:
	@not_found=0;                                 \
    for i in $(FILES);                            \
    do                                            \
        if [ -e $$i ];                            \
        then                                      \
            echo "$$i found";                     \
        else                                      \
            echo "$$i NOT FOUND";                 \
            not_found=`expr "$$not_found" + "1"`; \
        fi                                        \
    done;                                         \
    if [ $$not_found -ne 0 ];                     \
    then                                          \
        echo "$$not_found failures";              \
        exit 1;                                   \
    fi;                                           \
    echo "success";

clean:
	-rm -r *.pyc
	-rm -rf __pycache__
	-rm -rf idb-env
	-rm IDB2.html
	-rm IDB2.log

run:
	python main.py

deploy:
	gcloud deploy app

doc:
	make clean
	pydoc3.5 -w app/models.py
	mv models.html IDB2.html
	git log > IDB2.log

env:
	sudo pip install virtualenv
	virtualenv idb-env
	-source idb-env/bin/activate
	pip install -r requirements.txt

test:
