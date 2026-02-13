FROM maven:3.9.12-eclipse-temurin-21 AS build

WORKDIR /app
COPY src /app/src
COPY pom.xml /app

RUN mvn clean install -U

FROM eclipse-temurin:21-jre-noble 

WORKDIR /app
COPY --from=build /app/target/*.jar /app/app.jar
EXPOSE 8081

CMD ["java", "-jar", "app.jar"]