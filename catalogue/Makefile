build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/catalogue .

run:
	docker run --name catalogue -it --rm -p 8080:80 alhanouf1/catalogue
debug:
	docker run --entrypoint sh -it --rm alhanouf1/catalogue 

stop:
	docker container stop catalogue
