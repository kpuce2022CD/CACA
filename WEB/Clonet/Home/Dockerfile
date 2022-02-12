FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.war
COPY ${JAR_FILE_PATH} Home.war
ENTRYPOINT ["java","-war","./Home.war"]