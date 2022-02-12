FROM adoptopenjdk/openjdk11
CMD ["./mvnw", "clean", "package"]
ARG JAR_FILE_PATH=gradle/wrapper/gradle-wrapper.jar
COPY ${JAR_FILE_PATH} Home.jar
ENTRYPOINT ["java","-jar","/Home.jar"]