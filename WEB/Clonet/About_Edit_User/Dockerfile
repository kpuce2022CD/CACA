FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.war
COPY ${JAR_FILE_PATH} About_Edit_User.war
ENTRYPOINT ["java","-jar","./About_Edit_User.war"]

FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD springboot-slf4j-docker-1.0.0.war springboot-slf4j-docker-1.0.0.war
ENTRYPOINT ["java","-jar","/springboot-slf4j-docker-1.0.0.war"]
EXPOSE 8082