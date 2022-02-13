FROM openjdk:11
ARG JAR_FILE=./About_Edit_User/target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
#CMD [ "app.jar" ]