FROM openjdk:8-jdk-alpine
ARG JAR_FILE_PATH=target/*.war
COPY ${JAR_FILE_PATH} Illust_Select_User.war
ENTRYPOINT ["java","-war","./Illust_Select_User.war"]