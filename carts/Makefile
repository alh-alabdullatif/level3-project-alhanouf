build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/carts .

run:
	docker run --name carts -it --rm -p 8081:8081 alhanouf1/carts
debug:
	docker run --entrypoint sh -it --rm alhanouf1/carts

stop:
	docker container stop carts
