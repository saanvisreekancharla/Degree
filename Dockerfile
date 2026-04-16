 Dockerfile
# Use Maven to build the app
FROM maven:3.8.4-openjdk-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package
# Use OpenJDK to run the app
FROM openjdk:17-jdk-slim
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

5. Jenkinsfile - pipeline script
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Replace with your actual GitHub URL
                git 'https://github.com/your-username/your-repo.git' [cite: 5]
            }
        }
        stage('Build & Test') {
            steps {
                sh 'mvn clean test' [cite: 4]
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t java-devops-app .' [cite: 8]
            }
        }
    }
}