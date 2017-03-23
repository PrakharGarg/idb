FILES :=                          	\
    .gitignore                    	\
    main.py                       	\
    requirements.txt				\

check:
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
