.PHONY: up roles-create docker-login docker-sec cart cart-delete cart-logs catalouge catalouge-delete catalouge-logs front-end front-end-delete front-end-logs orders orders-delete orders-logs payment payment-delete payment-logs q-master q-master-delete q-master-logs shipping shipping-delete shipping-logs user user-delete user-logs delete-sec


up: roles-create docker-sec cart cart-logs catalouge catalouge-logs front-end front-end-logs orders orders-logs	payment payment-logs q-master q-master-logs shipping shipping-logs user user-logs

down: roles-delete delete-docker-sec cart-delete catalouge-delete catalouge front-end-delete orders-delete payment-delete q-master-delete shipping-delete  user-delete

roles-create:
	 kubectl apply -f tekton/sa.yaml -f tekton/clusterrole.yaml -f tekton/clusterrolebinding.yaml -f tekton/kaniko/kaniko-source-pvc.yaml -f tekton/kaniko/git-clone-task.yaml -n test
roles-delete:
	kubectl delete -f tekton/sa.yaml -f tekton/clusterrole.yaml -f tekton/clusterrolebinding.yaml -f tekton/kaniko/kaniko-source-pvc.yaml -f tekton/kaniko/git-clone-task.yaml -n test

docker-login:
	 sudo source tekton/docker-login.sh
docker-sec:
	 kubectl create secret generic docker-seceret --from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json --type=kubernetes.io/dockerconfigjson -n test
delete-docker-sec:
	kubectl delete secret docker-seceret -n test

cart:
	kubectl apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/cart-build-task.yaml -f tekton/test-deploy/deploy/carts-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/cart-pipeline.yaml -n test
cart-delete:
	kubectl delete -f tekton/kaniko/cart-build-task.yaml -f tekton/test-deploy/deploy/carts-deploy-task.yaml  -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/cart-pipeline.yaml -n test
cart-logs:
	 tkn pr logs -f cart-pipeline-run -n test
catalouge:
	 kubectl apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/cat-build-task.yaml -f tekton/kaniko/cat-db-build-task.yaml -f tekton/test-deploy/deploy/cat-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/cat-pipeline.yaml -n test

catalouge-delete:
	kubectl delete -f tekton/kaniko/cat-build-task.yaml -f tekton/kaniko/cat-db-build-task.yaml -f tekton/test-deploy/deploy/cat-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/cat-pipeline.yaml -n test
catalouge-logs:
	tkn pr logs -f cat-pipeline-run -n test

front-end:
	kubectl apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/fe-build-task.yaml -f tekton/test-deploy/deploy/fe-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/test-deploy/deploy/all-deploy-task.yaml -f tekton/pipelines/fe-pipeline.yaml -n test
front-end-delete:
	kubectl delete -f tekton/kaniko/fe-build-task.yaml -f tekton/test-deploy/deploy/fe-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/fe-pipeline.yaml -n test
front-end-logs:
	tkn pr logs -f fe-pipeline-run -n test
orders:
	kubectl apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/ord-build-task.yaml -f tekton/test-deploy/deploy/ord-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/ord-pipeline.yaml -n test

orders-delete:
	kubectl delete -f tekton/kaniko/ord-build-task.yaml -f tekton/test-deploy/deploy/ord-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/ord-pipeline.yaml -n test
orders-logs:
	tkn pr logs -f ord-pipeline-run -n test

payment:
	kubectl apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/pay-build-task.yaml -f tekton/test-deploy/deploy/pay-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/pay-pipeline.yaml  -n test
payment-delete:
	kubectl delete -f tekton/kaniko/pay-build-task.yaml -f tekton/test-deploy/deploy/pay-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/pay-pipeline.yaml -n test
payment-logs:
	tkn pr logs -f pay-pipeline-run -n test

q-master:
	kubectl apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/q-master-build-task.yaml -f tekton/test-deploy/deploy/q-master-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/q-master-pipeline.yaml -n test

q-master-delete:
	kubectl delete -f tekton/kaniko/q-master-build-task.yaml -f tekton/test-deploy/deploy/q-master-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/q-master-pipeline.yaml -n test

q-master-logs:
	tkn pr logs -f q-master-pipeline-run -n test

shipping:
	kubectl apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/shipping-build-task.yaml -f tekton/test-deploy/deploy/shipping-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/shipping-pipeline.yaml -n test
shipping-delete:
	kubectl delete -f tekton/kaniko/shipping-build-task.yaml -f tekton/test-deploy/deploy/shipping-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/shipping-pipeline.yaml -n test

shipping-logs:
	tkn pr logs -f shipping-pipeline-run -n test
user:
	kubectl apply -f tekton/kaniko/git-clone-task.yaml -f tekton/kaniko/user-db-build-task.yaml -f tekton/kaniko/user-build-task.yaml -f tekton/test-deploy/deploy/user-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/user-pipeline.yaml -n test

user-delete:
	kubectl delete -f tekton/kaniko/user-db-build-task.yaml -f tekton/kaniko/user-build-task.yaml -f tekton/test-deploy/deploy/user-deploy-task.yaml -f tekton/test-deploy/test/test-task.yaml -f tekton/pipelines/user-pipeline.yaml -n test

user-logs:
	tkn pr logs -f user-pipeline-run -n test

delete-all-test:
	kubectl delete all --all -n test 
delete-all-prod:
	kubectl delete all --all -n prod

delete-pipeline-runs:
	tkn pr delete cat-pipeline-run user-pipeline-run shipping-pipeline-run q-master-pipeline-run pay-pipeline-run ord-pipeline-run fe-pipeline-run cart-pipeline-run -n test

list-pipeline-run:
	tkn pr list -n test
