// pipeline {
//     agent any

//     stages {
//         stage('SCM') {
//             steps {
//                 checkout scm
//             }
//         }
        
//         stage('SonarQube Analysis') {
//             steps {
//                 script {
//                   def mvn = tool 'M3'
//                   withSonarQubeEnv() {
//                     sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=java"
//                   }
//               }
//           }
//       }
//   }
// }
pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage ('Checkout') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main',
                    url: 'https://github.com/nanu1605/DEVOPS-final-project.git'
            }
        }
        stage('Build') {
            steps {
                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Install') {
            steps {
                sh "mvn install"
            }
        }
        stage ('Deploy') {
            steps {
                echo "Deploying"
                deploy adapters: [tomcat9 (
                    credentialsId: 'tom-gui-admin',
                    path: '',
                    url: 'http://23.101.158.243:8088/'
                )],
                contextPath: 'DEVOPS-final-Project',
                onFailure: 'false',
                war: '**/*.war'
            }
            post {
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.war'
                }
            }
        }
    }
}
