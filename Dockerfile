# Inject the JAR file into a new container to keep the file small
FROM image-registry.openshift-image-registry.svc:5000/project1/openjdk:8
WORKDIR home/app
COPY ./target/platform.jar /app/app.jar
EXPOSE 8080

RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar 
RUN wget https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/tomcat.yml
RUN rm -rf /usr/local/tomcat/webapps/* 


ENV CATALINA_OPTS -javaagent:home/app/jmx_prometheus_javaagent-0.16.1.jar=1738:home/app/tomcat.yml
RUN chgrp -R 0 /usr/local/tomcat/ && \
chmod -R g-u /usr/local/tomcat/ 

EXPOSE 1738
CMD ["java -javaagent:home/app/jmx_prometheus_javaagent-0.16.1.jar:1738 -jar app.jar"]
