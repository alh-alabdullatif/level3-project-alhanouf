# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-11 AS build

WORKDIR /tmp-cart
COPY src /tmp-cart/src
COPY pom.xml /tmp-cart
#RUN mvn clean package
RUN mvn clean package

#FROM adoptopenjdk/openjdk11:alpine
FROM weaveworksdemos/msd-java:jre-latest

COPY --from=build /tmp-cart/target/carts.jar /carts.jar

RUN chmod a+rx ./carts.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT


LABEL org.label-schema.vendor="Weaveworks" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Cart" \
  org.label-schema.description="REST API for Cart service" \
  org.label-schema.url="https://github.com/microservices-demo/carts" \
  org.label-schema.vcs-url="github.com:microservices-demo/carts.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/usr/local/bin/java.sh","-jar","../carts.jar", "--port=80"]
