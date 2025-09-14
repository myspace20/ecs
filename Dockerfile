# ---------- Stage 1: Build ----------
FROM maven:3.9.6-eclipse-temurin-21 AS builder

# Set workdir
WORKDIR /build

# Copy pom.xml first (for dependency caching)
COPY pom.xml .

# Download dependencies (cached if pom.xml unchanged)
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the app (skip tests for faster builds, remove -DskipTests if you want tests)
RUN mvn clean package -DskipTests

# ---------- Stage 2: Runtime ----------
FROM eclipse-temurin:21-jdk AS runtime

WORKDIR /app

# Copy only the built jar (adjust target path if necessary)
COPY --from=builder /build/target/*.jar app.jar

# Expose app port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
