FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=/build/libs/*.war
COPY ${JAR_FILE_PATH} About_Cusotmer.war
ENTRYPOINT ["java","-jar","./About_Cusotmer.war"]