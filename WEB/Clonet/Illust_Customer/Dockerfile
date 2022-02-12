FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.war
COPY ${JAR_FILE_PATH} Illust_Customer.war
ENTRYPOINT ["java","-war","./Illust_Customer.war"]