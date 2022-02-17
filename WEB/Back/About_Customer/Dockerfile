FROM openjdk:11
ARG JAR_FILE=./About_Customer/target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/app.jar"]