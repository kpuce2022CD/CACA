FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=/build/libs/*.war
COPY ${JAR_FILE_PATH} Illust_Select_User.war
ENTRYPOINT ["java","-jar","./Illust_Select_User.war"]