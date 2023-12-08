FROM amazoncorretto:17
WORKDIR /app-word-api
COPY target/words.jar /app-word-Api/.
EXPOSE 8080
CMD ["java","-jar","./words.jar"]
#CMD [ "/bin/sh", "-c", "java -jar /app-word-Api/words.jar" ]
#ENTRYPOINT [ "java","-jar", "words.jar" ]