FROM openjdk:17-jdk-alpine
ARG JAR_FILE=target/*.jar
RUN gradle bootJar --no-daemon

EXPOSE 8080
COPY ./build/libs/DebtTracker-1.jar app.jar
ENTRYPOINT [ "java","-jar","/app.jar"]