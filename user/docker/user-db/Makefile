build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/user-db .

run:
	docker run --name user-db -it --rm -p 27017:27017 alhanouf1/user-db
debug:
	docker run --entrypoint sh -it --rm alhanouf1/user-db

stop:
	docker container stop user-db

