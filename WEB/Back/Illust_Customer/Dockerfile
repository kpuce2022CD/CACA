FROM openjdk:11
ARG JAR_FILE=./Illust_Customer/target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8086
ENTRYPOINT ["java","-jar","/app.jar"]
#CMD [ "app.jar" ]