build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/catalogue-db .

run:
	docker run --name catalogue-db -it --rm -p 3306:3306 alhanouf1/catalogue-db
debug:
	docker run --entrypoint sh -it --rm alhanouf1/catalogue-db

stop:
	docker container stop catalogue-db

