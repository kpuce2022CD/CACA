FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=/build/libs/*.war
COPY ${JAR_FILE_PATH} Contact_Customer.war
ENTRYPOINT ["java","-jar","./Contact_Customer.war"]