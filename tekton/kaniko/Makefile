.PHONY: up create-cat delete-cat ord-pr-logs cat-pr-logs create-cat delete-cat create-front-end delete-front-end

up:
	 kubectl create -f sa.yaml -f rbac.yaml -f kaniko-source-pvc.yaml -f git-clone-task.yaml

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
	kubectl create -f cat-build-task.yaml -f cat-db-build-task.yaml -f cat-pipeline.yaml
delete-cat:
	kubectl delete -f cat-build-task.yaml -f cat-db-build-task.yaml -f cat-pipeline.yaml

create-front-end:
	k create -f fe-build-task.yaml -f fe-pipeline.yaml
delete-front-end:
	k delete -f fe-build-task.yaml -f fe-pipeline.yaml

create-ord:
	k create -f ord-build-task.yaml -f ord-pipeline.yaml
delete-ord:
	k delete -f ord-build-task.yaml -f ord-pipeline.yaml
create-cart:
	k create -f cart-build-task.yaml -f cart-pipeline.yaml 
delete-cart:
	k delete -f cart-build-task.yaml -f cart-pipeline.yaml 

create-shipping:
	k create -f shipping-build-task.yaml -f shipping-pipeline.yaml
	
delete-shipping:
	k delete -f shipping-build-task.yaml -f shipping-pipeline.yaml
create-q-master:
	k create -f q-master-build-task.yaml -f q-master-pipeline.yaml 

delete-q-master:
	k delete -f q-master-build-task.yaml -f q-master-pipeline.yaml

create-pay:
	k create -f pay-build-task.yaml -f pay-pipeline.yaml	
delete-pay:
	k delete -f pay-build-task.yaml -f pay-pipeline.yaml
create-user:
	k create -f user-build-task.yaml -f user-pipeline.yaml
delete-user:
	k delete -f user-build-task.yaml -f user-pipeline.yaml
