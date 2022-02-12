FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=/build/libs/*.war
COPY ${JAR_FILE_PATH} About_Edit_User.war
ENTRYPOINT ["java","-jar","./About_Edit_User.war"]