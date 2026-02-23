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
        stage('Test maven') {
            steps {
                bat 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') {
            steps {
                powershell './jenkins/scripts/deliver.sh'
            }
        }
    }
}
