FROM openjdk:11
ARG JAR_FILE=./Illust_Select_User/target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8087
ENTRYPOINT ["java","-jar","/app.jar"]
#CMD [ "app.jar" ]