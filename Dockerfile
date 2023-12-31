# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-11-slim AS build
# Set the working directory in the container
WORKDIR /app
# Copy the pom.xml and the project files to the container
COPY pom.xml .
COPY src ./src
# Build the application using Maven
RUN mvn clean package -DskipTests
# Use an official OpenJDK image as the base image
FROM openjdk:21-jdk-slim
# Set the working directory in the container
WORKDIR /app
copy ./target/Travel-Website-0.0.1-SNAPSHOT.jar Travel-Website-0.0.1-SNAPSHOT.jar
# Set the command to run the application
CMD ["java", "-jar", "Travel-Website-0.0.1-SNAPSHOT.jar"]