build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/user .

run:
	docker run --name user -it --rm -p 8080:80 alhanouf1/user
debug:
	docker run --entrypoint sh -it --rm alhanouf1/user

stop:
	docker container stop user 

