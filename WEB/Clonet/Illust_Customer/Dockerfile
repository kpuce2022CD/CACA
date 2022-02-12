FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.jar
COPY ${JAR_FILE_PATH} Illust_Customer.jar
ENTRYPOINT ["java","-jar","./Illust_Customer.jar"]
