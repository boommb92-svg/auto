# Stage 1: build with Maven
FROM maven:3.8.8-eclipse-temurin-17 AS builder
WORKDIR /app

# copy only what is needed to leverage Docker cache
COPY pom.xml .
COPY src ./src

# Build the app (skip tests in CI for speed; remove -DskipTests for full test)
RUN mvn -B -DskipTests package

# Stage 2: runtime
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
# copy jar from builder stage (matches whatever Maven produced)
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
