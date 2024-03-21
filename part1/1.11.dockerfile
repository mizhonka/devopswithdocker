FROM amazoncorretto:8
EXPOSE 8080
COPY . .
RUN ./mvnw package
ENTRYPOINT ["java", "-jar", "./target/docker-example-1.1.3.jar"]
