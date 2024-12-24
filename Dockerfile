# FROM openjdk:17-jdk-alpine
# ARG JAR_FILE=target/*.jar
# RUN gradle bootJar --no-daemon
#
# EXPOSE 8080
# COPY ./build/libs/DebtTracker-1.jar app.jar
# ENTRYPOINT [ "java","-jar","/app.jar"]
FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install openjdk-17-jdk -y
COPY . .
RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-jdk-slim
EXPOSE 8080
COPY --from=build /build/libs/demo-1.jar app.jar
ENTRYPOINT [ "java","-jar","/app.jar"]