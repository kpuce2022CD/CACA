FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.war
COPY ${JAR_FILE_PATH} Contact_Edit_User.war
ENTRYPOINT ["java","-war","./Contact_Edit_User.war"]