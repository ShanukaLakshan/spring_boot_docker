# Start a new stage with just the Java runtime.
FROM openjdk:17-alpine

# Use an image with both Maven and Java.
FROM maven:3.8.4-openjdk-17 as builder

# Set the working directory in the builder image.
WORKDIR /workspace

# Copy the Maven pom.xml and src directory into the image.
COPY pom.xml ./
COPY src ./src/

# Run the Maven package command.
RUN mvn clean package

WORKDIR /opt

ENV PORT 8080

EXPOSE 8080

# Copy the built jar file from the builder stage.
COPY --from=builder /workspace/target/*.jar /opt/app.jar

ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
