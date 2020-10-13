build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/orders .

run:
	docker run --name orders -it --rm -p 81:80 alhanouf1/orders
debug:
	docker run --entrypoint sh -it --rm alhanouf1/orders 

stop:
	docker container stop orders 

