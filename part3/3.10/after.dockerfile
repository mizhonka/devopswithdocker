FROM amazoncorretto:8-alpine
EXPOSE 8080
COPY . .
RUN ./mvnw package
USER 1000
ENTRYPOINT ["java", "-jar", "./target/docker-example-1.1.3.jar"]
