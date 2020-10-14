build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag alhanouf1/queue-master .

run:
	docker run --name q-master -it --rm -p 80:80 alhanouf1/queue-master
debug:
	docker run --entrypoint sh -it --rm alhanouf1/queue-master 

stop:
	docker container stop q-master

