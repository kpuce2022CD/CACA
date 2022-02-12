FROM adoptopenjdk/openjdk11
CMD ["./mvnw", "clean", "package"]
ARG JAR_FILE_PATH=gradle/wrapper/gradle-wrapper.jar
COPY ${JAR_FILE_PATH} About_Edit_User.jar
ENTRYPOINT ["java","-jar","/About_Edit_User.jar"]