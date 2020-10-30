#!/bin/bash
#
#kubectl apply -f elf.namespace.yaml
helm repo add elastic https://helm.elastic.co
helm repo add fluent https://fluent.github.io/helm-charts
helm repo update
helm install elasticsearch elastic/elasticsearch --version=7.9.0 --namespace=logging
helm install fluent-bit fluent/fluent-bit --namespace=logging
helm install kibana elastic/kibana --version=7.9.0 --namespace=logging --set service.type=NodePort
kubectl run random-logger --image=chentex/random-logger -n logging
#kubectl apply -f ingress-elf.yaml -n elf
