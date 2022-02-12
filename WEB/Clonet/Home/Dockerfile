FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.jar
COPY ${JAR_FILE_PATH} Home.jar
ENTRYPOINT ["java","-jar","./Home.jar"]