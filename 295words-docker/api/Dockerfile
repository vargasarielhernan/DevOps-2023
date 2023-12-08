FROM amazoncorretto:17
WORKDIR /app-word-api
COPY target/*jar /app-word-Api/.
EXPOSE 8080
#CMD [ "/bin/sh", "-c", "java -jar /app-word-Api/*.jar" ]
ENTRYPOINT [ "java","-jar", "/words.jar" ]