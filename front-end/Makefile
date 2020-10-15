build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/front-end .

run:
	docker run --name front-end -it --rm -p 8079:8079 alhanouf1/front-end
debug:
	docker run --entrypoint sh -it --rm alhanouf1/front-end 

stop:
	docker container stop front-end 
