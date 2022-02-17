FROM openjdk:11
ARG JAR_FILE=./Contact_Edit_User/target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8084
ENTRYPOINT ["java","-jar","/app.jar"]
#CMD [ "app.jar" ]