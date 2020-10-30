# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-11 AS build

WORKDIR /tmp-order
COPY src /tmp-order/src
COPY pom.xml /tmp-order
#RUN mvn clean package
RUN mvn clean package

#FROM adoptopenjdk/openjdk11:alpine
FROM weaveworksdemos/msd-java:jre-latest

COPY --from=build /tmp-order/target/orders.jar /orders.jar

RUN chmod a+rx ./orders.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="alhanouf1" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Orders" \
  org.label-schema.description="REST API for Orders service" \
  org.label-schema.url="https://github.com/microservices-demo/orders" \
  org.label-schema.vcs-url="github.com:microservices-demo/orders.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"

#RUN chown -R ${SERVICE_USER}:${SERVICE_GROUP} ./app.jar

#USER ${SERVICE_USER}

ENTRYPOINT ["usr/bin/java","-jar","../orders.jar", "--port=80"]
