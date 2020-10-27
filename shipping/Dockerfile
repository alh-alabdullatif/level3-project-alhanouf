# syntax=docker/dockerfile:experimental
FROM maven:3-jdk-11 as build
WORKDIR /tmp

COPY src /tmp/src
COPY pom.xml /tmp/

RUN  mvn clean package

#FROM adoptopenjdk/openjdk11:alpine
FROM weaveworksdemos/msd-java:jre-latest
COPY --from=build /tmp/target/shipping.jar /shipping.jar

RUN chmod a+rx ./shipping.jar

USER ${SERVICE_USER}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="alhanouf1" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socks Shop: Shipping" \
  org.label-schema.description="REST API for Shipping service" \
  org.label-schema.url="https://github.com/microservices-demo/shipping" \
  org.label-schema.vcs-url="github.com:microservices-demo/shipping.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/opt/java/openjdk/bin/java","-jar","./shipping.jar", "--port=80"]
