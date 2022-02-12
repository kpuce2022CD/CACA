FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=/build/libs/*.war
COPY ${JAR_FILE_PATH} Login.war
ENTRYPOINT ["java","-jar","./Login.war"]