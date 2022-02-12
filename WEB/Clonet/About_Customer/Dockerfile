FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.war
COPY ${JAR_FILE_PATH} About_Customer.war
ENTRYPOINT ["java","-war","./About_Customer.war"]