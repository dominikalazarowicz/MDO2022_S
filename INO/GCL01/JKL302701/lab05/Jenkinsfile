pipeline {
    agent any
    stages{
        
        stage('Build') {
            steps {
                echo 'BUILD'
                git branch: 'JKL302701', url: 'https://github.com/InzynieriaOprogramowaniaAGH/MDO2022_S.git'
                dir('INO/GCL01/JKL302701/lab05') {
                    sh 'docker build . -f df1.dockerfile -t builder'
                }
            }
        }
        
        stage('Tests') {
            steps {
                echo 'TESTS'
                dir('INO/GCL01/JKL302701/lab05') {
                    sh 'docker build . -f df2.dockerfile -t tester'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                echo 'DEPLOY'
                sh 'docker run --volume /var/jenkins_home/workspace/PipeLine/INO/GCL01/JKL302701/lab05:/finalBuild builder mv -n build /finalBuild'
                dir('INO/GCL01/JKL302701/lab05') {
                    sh 'docker build . -f df3.dockerfile -t deploy'
                }
                sh 'docker run --volume /var/jenkins_home/workspace/PipeLine/INO/GCL01/JKL302701/lab05/build:/build -d -p 3000:80 deploy'
                sh 'docker stop $(docker ps -a -q)'
            }
        }    
        
        
          stage('Publish') {
            steps {
                echo 'PUBLISH'
                dir('INO/GCL01/JKL302701/lab05') {
                    sh 'docker build . -f df4.dockerfile -t publisher'
                }
                sh "docker run --volume /var/jenkins_home/workspace/PipeLine/INO/GCL01/JKL302701/lab05:/finalArchive publisher mv archive.tar.xz /finalArchive"
            }
        }
        
        
        
        
    }
    

}
