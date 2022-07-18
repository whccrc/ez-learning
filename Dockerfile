# Inject the JAR file into a new container to keep the file small
FROM image-registry.openshift-image-registry.svc:5000/project1/openjdk:8
WORKDIR /app
COPY ./target/platform.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar app.jar"]
