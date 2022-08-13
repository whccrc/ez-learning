FROM image-registry.openshift-image-registry.svc:5000/project1/openjdk:8
WORKDIR /app
COPY ./target/platform.jar /app/app.jar
EXPOSE 8080

RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar 
RUN wget https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/tomcat.yml
RUN rm -rf /usr/local/tomcat/webapps/* 
COPY ./target/platform.jar /usr/local/tomcat/webapps/ROOT.war
RUN ls /usr/local/tomcat/webapps/
RUN chgrp -R 0 /usr/local/tomcat/ && \
    chmod -R g=u /usr/local/tomcat/ 
EXPOSE 1738
#ENV CATALINA_OPTS -javaagent:/app/jmx_prometheus_javaagent-0.16.1.jar=1738:/app/tomcat.yml
ENTRYPOINT ["sh", "-c"]
 


#CMD ["catalina.sh", "run"]
CMD ["java -javaagent:/app/jmx_prometheus_javaagent-0.16.1.jar=1738:/app/tomcat.yml -jar app.jar"]
