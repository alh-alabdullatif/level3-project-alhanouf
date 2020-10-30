build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/load-test .

run:
	docker run --name load-test -it --rm -p 81:80 alhanouf1/load-test -h http://localhost -c 1 -r 1
debug:
	docker run --entrypoint sh -it --rm alhanouf1/load-test 

stop:
	docker container stop load-test 
