# FROM openjdk:17-jdk-slim AS buildz
# # FROM ubuntu:latest AS build
# WORKDIR /DebtTracker
# CMD ["./gradlew", "clean", "bootJar"]
# # COPY build/libs/*.jar app.jar
# RUN chmod +x COPY
# COPY --from=buildz /build/libs/*.jar app.jar
#
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "app.jar"]


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
# RUN chmod +x ./gradlew
RUN ./gradlew bootJar --no-daemon


FROM openjdk:17-jdk-slim
EXPOSE 8080
# COPY /build/libs/demo-1.jar app.jar
# RUN ls -l /
COPY --from=build /build/libs/DebtTracker-1.jar app.jar
ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
# ENTRYPOINT [ "java","-jar","/app.jar"]


# FROM openjdk:17
# WORKDIR /DebtTracker
# CMD ["./gradlew", "clean", "bootJar"]
# COPY /build/libs/*.jar app.jar
#
# EXPOSE 8080
# ENTRYPOINT ["java", "-jar", "app.jar"]