FILES :=                          	\
	filters.sql						\
	package.json 					\
	.gitignore                    	\
	requirements.txt				\
	project/models.py				\
	project/tests.py				\
	gulpfile.js						\


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
	-rm IDB3.html
	-rm IDB3.log

run:
	python project/main.py

test:
	python project/tests.py

cover:
	make clean
	coverage run --source="models" project/tests.py > c.tmp 2>&1
	coverage report -m >> c.tmp
	cat c.tmp

doc:
	make clean
	pydoc -w project/models.py
	mv models.html IDB3.html
	git log > IDB3.log

env:
	sudo pip install virtualenv
	virtualenv idb-env
	-source idb-env/bin/activate
	pip install -r requirements.txt
