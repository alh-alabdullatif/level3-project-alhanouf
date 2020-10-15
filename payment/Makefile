build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/payment .

run:
	docker run --name payment -it --rm -p 8082:80 alhanouf1/payment
debug:
	docker run --entrypoint sh -it --rm alhanouf1/payment

stop:
	docker container stop payment

