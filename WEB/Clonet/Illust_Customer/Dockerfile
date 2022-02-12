FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=/build/libs/*.war
COPY ${JAR_FILE_PATH} Illust_Customer.war
ENTRYPOINT ["java","-jar","./Illust_Customer.war"]