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
fe-pr-logs:
	tkn pr logs -f fe-pipeline-run

cart-pr-logs:
	tkn pr logs -f cart-pipeline-run

shipping-pr-logs:
	tkn pr logs -f shpping-pipeline-run

q-master-pr-logs:
	tkn pr logs -f q-master-pipeline-run

pay-pr-logs:
	tkn pr logs -f pay-pipeline-run

user-pr-logs:
	tkn pr logs -f user-pipeline-run

create-cat:

delete-cat:

create-front-end:

delete-front-end:

create-ord:
delete-ord:

create-cart:
delete-cart:

create-shipping:
delete-shipping:

create-q-master:
delete-q-master:

create-pay:
delete-pay:

create-user:
delete-user:

