build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/edge-router .

run:
	docker run --name edge-router -it --rm -p 81:80 alhanouf1/edge-router
debug:
	docker run --entrypoint sh -it --rm alhanouf1/edge-router 

stop:
	docker container stop edge-router 

