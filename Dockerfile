# Stage 1: Build the application with Maven
FROM maven:3.9.2-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean install

# Stage 2: Run the application with JDK 17
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/my-app-1.0-SNAPSHOT.jar myapp.jar
CMD ["java", "-jar", "myapp.jar"]




