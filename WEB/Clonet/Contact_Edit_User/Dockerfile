FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.jar
COPY ${JAR_FILE_PATH} Contact_Edit_User.jar
ENTRYPOINT ["java","-jar","./Contact_Edit_User.jar"]