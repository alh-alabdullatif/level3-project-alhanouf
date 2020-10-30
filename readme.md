# DevOps Bootcamp Level 3 Final Project

## Capstone Project

We are demonstrating a near production-ready K8S platform hosting the Weaveworks Shock Shop demo. using kubernetes - Tekton - elf - prometheus and grafana

## Directories 
Each micro-service has it's own repo - there we have Dockerfile that will be used to build and run the images to docker hub

### Tekton 
- Contains clusterrole - clusterrole binding - service account

### Subdiectories
- Pipelines (*has the pipelines*)
- kaniko (*has build tasks*)
- test-deploy (*has all service and deployment files for the micro-services*)
	- subdiectories
	- deploy (*has tekton tasks for depolying the micro-services to name-space*)
	- test (*has tekton task for the test-task*)s
## Usage
1 - Go to K8s-sandbox make up (to bring up k8s and needed tools)

2 - Go back to the main directory (*level3-project-alhanouf*)
3 - docker login -u username
        enter your password
4 - make up

## Notes
Pipelines will run and perform the build and push image to dockerhub task , they will fail because not all services are running + we will have to run them again to do that do the following:

while in the main directory 
- make delete-pipeline-run 
- make delete-docker-sec
- make up

## Pipelines structure 

each micro-services has its own pipeline each will have 4 Tekton tasks except user & catalouge will have 5 steps (for building the db image)
1 - building the image and or db
2 - applying the micro-services to the test name-space 
3 - running the tests
4 - deplying the micro-services to prod name-space

## Dashboards
can be found in k8s-sandbox under json-dashboard folder
## More

- The tools can be accessed via Nodeport
- Explore the Makefile for more commands 

