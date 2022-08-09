# Inject the JAR file into a new container to keep the file small
FROM image-registry.openshift-image-registry.svc:5000/project1/openjdk:8
WORKDIR /app
COPY ./target/platform.jar /app/app.jar
EXPOSE 8080

RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar 
RUN wget https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/tomcat.yml


ENV CATALINA_OPTS -javaagent:/app/jmx_prometheus_javaagent-0.16.1.jar=1738:/app/tomcat.yml


EXPOSE 1738
ENTRYPOINT ["sh", "-c"]
CMD ["java -javaagent:/home/app/jmx_prometheus_javaagent-0.16.1.jar:1738 -jar app.jar"]
