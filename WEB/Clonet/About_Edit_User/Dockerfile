FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.jar
COPY ${JAR_FILE_PATH} About_Edit_User.jar
ENTRYPOINT ["java","-jar","./About_Edit_User.jar"]