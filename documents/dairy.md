Sat 10-10-2020 
-Understand the structure of the microservices

Sun 11-10
-Testing/fixing compelete yaml files in kubernetes\
-Problem: yaml files used older apiversion\
-Sloution: used the new apiversion \

Mon  12-10
-Wordked on building the micro-services locally \
-Fixing Dockerfiles to build \
-Creating Makefiles for easier usage \
-Worked on the services (front-end,shipping,order,cart) \

-Problem: had an err (failed to build no such file or directory) \
-Fix: sh into container to debug and do which java to know location of java and jarfile \

Tue  13-10
-Continue to work on order,cart,order-db,user-db \
-Pushed finished images to dockerhub (front-end,order,shipping) \
-Problem: had error when working with order (Unknow flag mount) \
-Fix: add the comment (# syntax=docker/dockerfile:experimental) to top of Dockerfile \

-Problem: had error when working with order (Executor failed running mvn clean package) \
-Fix:delete the plugin dependencies in the pom.xml \

Wed  14-10
Started working on Queue Master\ 

Thu  15-10
Countiue working on Queue Master \
used jdk 8 and used mvn clean package instead of cache\
Merged braches and removed conflicts \
Fri  16-10
Coutine to work on merging braches and removing conflicts \
added install-tkn-cli to Makefile \
Sat  17-10

Sun  18-10

Mon  19-10
had the same error for muliple days invalid input resource turns out using the alpha version 
switched to beta and used git-clone task instead of using PipelineResource which is deprecated \

Tue  20-10

Wed  21-10

Thu  22-10
Fri  23-10
Sat  24-10
Sun  25-10
Mon  26-10
-Problem: the images catalouge shipping q-master had errors while running CrashLoopBackOff \
- fix: working on catalouge
Tue  27-10
-Problem: the images catalouge shipping q-master had errors while running CrashLoopBackOff \
-Fix: reused the jre images by waveworks in the Dockerfile \
- Started working on the test task \
Wed  28-10
Countiue working on the test task 
Thu 29-10
Fri  30-10

