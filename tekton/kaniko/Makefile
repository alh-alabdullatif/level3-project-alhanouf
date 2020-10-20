.PHONY: up ord-pr-logs cat-pr-logs create-cat delete-cat create-front-end delete-front-end

up:
	 k create -f sa.yaml -f rbac.yaml -f kaniko-source-pvc.yaml -f git-clone-task.yaml

docker-login:
	 docker login -u alhanouf1
docker-sec:
	 k create secret generic docker-seceret --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json --type=kubernetes.io/dockerconfigjson
ord-pr-logs:
	 tkn pr logs -f ord-pipeline-run
cat-pr-logs:
	 tkn pr logs -f cat-pipeline-run
create-cat:

delete-cat:

create-front-end:

delete-front-end:



