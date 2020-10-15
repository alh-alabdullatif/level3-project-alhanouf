build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/e2etest .

run:
	docker run --name e2etest -it --rm -p 81:80 alhanouf1/e2etest
debug:
	docker run --entrypoint sh -it --rm alhanouf1/e2etest 

stop:
	docker container stop e2etest 
