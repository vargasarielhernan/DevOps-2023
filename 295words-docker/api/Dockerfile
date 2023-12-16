# FROM maven:3.8.5-openjdk-18 AS build

# RUN mkdir -p /opt/api-w; exit 0

# WORKDIR /opt/api-w
# COPY /src ./src
# COPY /pom.xml .
# RUN mvn clean package


# FROM amazoncorretto:18
# RUN yum  install -y net-tools

# WORKDIR /opt/api-w
# COPY --from=build /opt/api-w/target/words-jar-with-dependencies.jar ./words1.jar
# #COPY --from=build /opt/api-w/target/words.jar ./words1.jar
# EXPOSE 8080

# ENTRYPOINT ["java", "-jar", "./words1.jar"]
FROM maven:3.9-amazoncorretto-20 AS builder
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -e -B package 

FROM openjdk:18
COPY --from=builder target/*.jar words.jar  
EXPOSE 8080
CMD ["java", "-jar", "Main"]