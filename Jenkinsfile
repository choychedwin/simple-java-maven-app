pipeline {
    agent any
    tools {
        maven 'Maven 3.9.12'
        jdk 'JDK 21'
    }
    stages {
        stage('Build') {
            steps {
                bat 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                bat 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('DockerBuild') {
            steps {
                bat 'docker build -t maven-app .'
            }
        }
        stage('DockerRun') {
            steps {
                bat 'cker run -p 8081:8081 maven-app'
            }
        }
        stage('Deliver') {
            steps {
                powershell './jenkins/scripts/deliver.sh'
            }
        }
    }
}
