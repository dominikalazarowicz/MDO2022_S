pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'mkdir -p shared_volume'
                    docker.image('alkowskey/devopsbuilder1').run("-v \$(pwd)/shared_volume:/in -it")
                    sh 'ls ./shared_volume -la'
                    sh 'ls shared_volume/simple-typescript-starter -la'
                }
            }
        }
        stage('Test'){
            steps{
                script{
                    docker.image('alkowskey/devopstester').run("-v \$(pwd)/shared_volume:/in -it")
                    sh 'ls ./shared_volume -la'
                    sh 'ls shared_volume/simple-typescript-starter -la'

                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    docker.image('alkowskey/devopsdeployer:latest').run("-v \$(pwd)/shared_volume:/in")
                    sh 'ls ./shared_volume -la'
                    sh 'ls shared_volume/simple-typescript-starter -la'

                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'shared_volume/deploy.tar.gz', fingerprint: true
        }
    }
}
