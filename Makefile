.PHONY: roles-create docker-login docker-sec cart cart-delete cart-logs catalouge catalouge-delete catalouge-logs front-end front-end-delete front-end-logs orders orders-delete orders-logs payment payment-delete payment-logs q-master q-master-delete q-master-logs shipping shipping-delete shipping-logs user user-delete user-logs

roles-create:
	 kubectl apply -f tekton/sa.yaml -f tekton/clusterrole.yaml -f tekton/clusterrolebinding.yaml -f tekton/kaniko/kaniko-source-pvc.yaml -f tekton/kaniko/git-clone-task.yaml

docker-login:
	 sudo source tekton/docker-login.sh
docker-sec:
	 kubectl create secret generic docker-seceret --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json --type=kubernetes.io/dockerconfigjson

cart:
	kubectl create -f tekton/kaniko/cart-build-task.yaml -f tekton/test-deploy/deploy/carts-deploy-task.yaml -f tekton/pipelines/cart-pipeline.yaml 
cart-delete:
	kubectl delete -f tekton/kaniko/cart-build-task.yaml -f tekton/test-deploy/deploy/carts-deploy-task.yaml  -f tekton/pipelines/cart-pipeline.yaml
cart-logs:
	 tkn pr logs -f cart-pipeline-run
catalouge:
	 kubectl delete -f cat-build-task.yaml -f cat-db-build-task.yaml -f cat-pipeline.yaml

catalouge-delete:

catalouge-logs:
	tkn pr logs -f cat-pipeline-run

front-end:

front-end-delete:

front-end-logs:
	tkn pr logs -f fe-pipeline-run
orders:

orders-delete:

orders-logs:
	tkn pr logs -f ord-pipeline-run

payment:

payment-delete:

payment-logs:
	tkn pr logs -f pay-pipeline-run

q-master:

q-master-delete:

q-master-logs:
	tkn pr logs -f q-master-pipeline-run

shipping:

shipping-delete:

shipping-logs:
	tkn pr logs -f shipping-pipeline-run
user:

user-delete:

user-logs:
	tkn pr logs -f user-pipeline-run


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
