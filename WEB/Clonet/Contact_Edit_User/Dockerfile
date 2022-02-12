FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=/build/libs/*.war
COPY ${JAR_FILE_PATH} Contact_Edit_User.war
ENTRYPOINT ["java","-jar","./Contact_Edit_User.war"]