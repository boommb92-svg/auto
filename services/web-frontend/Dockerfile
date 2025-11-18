# web-frontend Dockerfile (Spring Boot sample)
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY target/web-frontend.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
