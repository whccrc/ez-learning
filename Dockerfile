FROM image-registry.openshift-image-registry.svc:5000/project1/openjdk:8
WORKDIR /home/app
COPY ./target/platform.jar /app/app.jar
EXPOSE 8080

RUN wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar 
RUN wget https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/tomcat.yml
COPY ./target/platform.jar /usr/local/tomcat/webapps/ROOT.war
EXPOSE 1738
ENV CATALINA_OPTS -javaagent:/home/app/jmx_prometheus_javaagent-0.16.1.jar=1738:home/app/tomcat.yml
ENTRYPOINT ["sh", "-c"]
 


CMD ["catalina.sh", "run"]
CMD ["java -jar -javaagent:/home/app/jmx_prometheus_javaagent-0.16.1.jar=1738:tomcat.yml app.jar"]
