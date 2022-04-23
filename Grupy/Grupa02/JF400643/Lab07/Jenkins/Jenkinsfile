pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker-compose --file dockerArtifacts/docker-compose.yml build'
                script {
                    if (currentBuild.currentResult == 'SUCCESS') {
                        sh 'echo "Built succesfully! <3" > buildResult.txt'
                    }
                    else {
                        sh 'echo "Build failed! :(" > buildResult.txt'
                    }
                    archiveArtifacts artifacts: 'buildResult.txt'
                }
            }
        }

        stage('Test') {
            steps {
                sh 'docker-compose --file dockerArtifacts/docker-compose.yml up'
                script {
                    if (currentBuild.currentResult == 'SUCCESS') {
                        sh 'echo "All tests passed! <3" > testResult.txt'
                    }
                    else {
                        sh 'echo "Some tests failed! <3" > testResult.txt'
                    }
                    archiveArtifacts artifacts: 'testResult.txt'
                }
            }
        }
    }
}
