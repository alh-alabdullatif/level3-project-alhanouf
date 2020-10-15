Sat 10-10-2020 
-Understand the structure of the microservices

Sun 11-10
-Testing/fixing compelete yaml files in kubernetes
-Problem: yaml files used older apiversion
-Sloution: used the new apiversion 

Mon  12-10
-Wordked on building the micro-services locally 
-Fixing Dockerfiles to build 
-Creating Makefiles for easier usage 
-Worked on the services (front-end,shipping,order,cart)

-Problem: had an err (failed to build no such file or directory)
-Fix: sh into container to debug and do which java to know location of java and jarfile

Tue  13-10
-Continue to work on order,cart,order-db,user-db
-Pushed finished images to dockerhub (front-end,order,shipping)
-Problem: had error when working with order (Unknow flag mount)
-Fix: add the comment (# syntax=docker/dockerfile:experimental) to top of Dockerfile

-Problem: had error when working with order (Executor failed running mvn clean package)
-Fix:delete the plugin dependencies in the pom.xml

Wed  14-10
Started working on Queue Master

Thu  15-10
Fri  16-10

Sat  17-10

Sun  18-10

Mon  19-10

Tue  20-10

Wed  21-10

Thu  22-10
