FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.jar
COPY ${JAR_FILE_PATH} Contact_Customer.jar
ENTRYPOINT ["java","-jar","./Contact_Customer.jar"]