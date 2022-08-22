FROM image-registry.openshift-image-registry.svc:5000/project1/openjdk:8
WORKDIR /app
COPY ./target/*.jar /app/app.jar
RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar 
RUN wget https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/tomcat.yml
EXPOSE 8080
EXPOSE 1738
ENTRYPOINT ["sh", "-c"]
CMD ["java -javaagent:/app/jmx_prometheus_javaagent-0.16.1.jar=1738:/app/tomcat.yml -jar /app/app.jar"]
