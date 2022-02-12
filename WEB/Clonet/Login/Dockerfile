FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.jar
COPY ${JAR_FILE_PATH} Login.jar
ENTRYPOINT ["java","-jar","./Login.jar"]