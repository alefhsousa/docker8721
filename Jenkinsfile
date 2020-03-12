pipeline {
    agent any

    stages {
        stage("Limpando a workspace") {
            steps {
                    sh 'pwd'
                    deleteDir()
            }
       }

       stage("Clonando projeto do github") {
           steps {
               git credentialsId: 'github-ssh', url: "git@github.com:alefhsousa/docker8721.git"
           }
       }

       stage('Rodar testes unitarios') {
           steps {
               sh "mvn clean test "
           }
       }

       stage('Gerando artefato') {
           steps {
               sh "mvn clean package -DskipTests "
           }
       }

       stage('Solicitando aprovacao') {
           steps {
               script {
                   slackSend(color: 'warning', message: "Para aprovar este deploy clique aqui: ${JOB_URL} - [Janela de 5 minutos]", channel: 'alefh-devops')
                   timeout(time: 5, unit: 'MINUTES') {
                   input(id: "Deploy Decision", message: "Deseja aprovar o deploy?", ok: 'Deploy')
               }
            }
           }
       }

       stage(deploy) {
           steps {
               sh 'scp -o StrictHostKeyChecking=no -i /home/vagrant/devops target/alura-forum.war vagrant@192.168.50.10:/home/vagrant/alura-forum.war'
               sh "ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.10 'sudo mv /home/vagrant/alura-forum.war /var/lib/tomcat8/webapps/alura-forum.war'"
           }
       }
    }
}