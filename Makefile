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
	 kubectl apply -f tekton/kaniko/cat-build-task.yaml -f tekton/kaniko/cat-db-build-task.yaml -f tekton/test-deploy/deploy/cat-deploy-task.yaml -f tekton/pipelines/cat-pipeline.yaml

catalouge-delete:
	kubectl delete -f tekton/kaniko/cat-build-task.yaml -f tekton/kaniko/cat-db-build-task.yaml -f tekton/test-deploy/deploy/cat-deploy-task.yaml -f tekton/pipelines/cat-pipeline.yaml 
catalouge-logs:
	tkn pr logs -f cat-pipeline-run

front-end:
	k apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/fe-build-task.yaml -f tekton/test-deploy/deploy/fe-deploy-task.yaml -f tekton/pipelines/fe-pipeline.yaml 
front-end-delete:
	k delete -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/fe-build-task.yaml -f tekton/test-deploy/deploy/fe-deploy-task.yaml -f tekton/pipelines/fe-pipeline.yaml
front-end-logs:
	tkn pr logs -f fe-pipeline-run
orders:
	kubectl apply -f tekton/kaniko/ord-build-task.yaml -f tekton/test-deploy/deploy/ord-deploy-task.yaml -f tekton/pipelines/ord-pipeline.yaml

orders-delete:
	kubectl delete -f tekton/kaniko/ord-build-task.yaml -f tekton/test-deploy/deploy/ord-deploy-task.yaml -f tekton/pipelines/ord-pipeline.yaml 
orders-logs:
	tkn pr logs -f ord-pipeline-run

payment:
	kubectl apply -f tekton/kaniko/pay-build-task.yaml -f tekton/test-deploy/deploy/pay-deploy-task.yaml -f tekton/pipelines/pay-pipeline.yaml 
payment-delete:
	kubectl delete -f tekton/kaniko/pay-build-task.yaml -f tekton/test-deploy/deploy/pay-deploy-task.yaml -f tekton/pipelines/pay-pipeline.yaml 
payment-logs:
	tkn pr logs -f pay-pipeline-run

q-master:
	kubectl apply -f tekton/kaniko/q-master-build-task.yaml -f tekton/test-deploy/deploy/q-master-deploy-task.yaml -f tekton/pipelines/q-master-pipeline.yaml

q-master-delete:
	kubectl delete -f tekton/kaniko/q-master-build-task.yaml -f tekton/test-deploy/deploy/q-master-deploy-task.yaml -f tekton/pipelines/q-master-pipeline.yaml

q-master-logs:
	tkn pr logs -f q-master-pipeline-run

shipping:
	kubectl apply -f tekton/kaniko/shipping-build-task.yaml -f tekton/test-deploy/deploy/shipping-deploy-task.yaml -f tekton/pipelines/shipping-pipeline.yaml
shipping-delete:
	kubectl delete -f tekton/kaniko/shipping-build-task.yaml -f tekton/test-deploy/deploy/shipping-deploy-task.yaml -f tekton/pipelines/shipping-pipeline.yaml

shipping-logs:
	tkn pr logs -f shipping-pipeline-run
user:
	kubectl apply -f tekton/kaniko/user-db-build-task.yaml -f tekton/kaniko/user-build-task.yaml -f tekton/test-deploy/deploy/user-deploy-task.yaml -f tekton/pipelines/user-pipeline.yaml 

user-delete:
	kubectl delete -f tekton/kaniko/user-db-build-task.yaml -f tekton/kaniko/user-build-task.yaml -f tekton/test-deploy/deploy/user-deploy-task.yaml -f tekton/pipelines/user-pipeline.yaml 

user-logs:
	tkn pr logs -f user-pipeline-run

delete-all-test:
	kubectl delete all --all -n test
delete-all-prod:
	kubectl delete all --all -n prod
