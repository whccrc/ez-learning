# Inject the JAR file into a new container to keep the file small
FROM openjdk:8
WORKDIR /app
COPY ./target/platform-*-SNAPSHOT.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar app.jar"]
