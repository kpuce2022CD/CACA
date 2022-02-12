FROM adoptopenjdk/openjdk11
CMD ["./mvnw", "clean", "package"]
ARG JAR_FILE_PATH=gradle/wrapper/gradle-wrapper.jar
COPY ${JAR_FILE_PATH} Illust_Customer.jar
ENTRYPOINT ["java","-jar","/Illust_Customer.jar"]