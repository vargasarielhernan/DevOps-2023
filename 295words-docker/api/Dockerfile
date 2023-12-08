FROM Alpine:lastest
RUN apk add openjdk18
RUN apk update
RUN apk upgrade --available && sync
RUN mkdir -p /app-word-Api
COPY target/*jar /app-word-Api/.
EXPOSE 8080
#CMD [ "/bin/sh", "-c", "java -jar /app-word-Api/*.jar" ]
ENTRYPOINT [ "java","-jar", "/*.jar" ]