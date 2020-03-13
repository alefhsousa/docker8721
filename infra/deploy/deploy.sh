#!/bin/bash
if [ "$(cat /home/vagrant/last_deploy)" = "blue" ]
then
        echo "O ultimo deploy foi o blue"

        echo "Iniciando o processo de atualização no green ..."

        scp -o StrictHostKeyChecking=no -i /home/vagrant/devops alura-forum-green.war vagrant@192.168.50.10:/home/vagrant/alura-forum.war
        ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.10 'sudo mv /home/vagrant/alura-forum.war /var/lib/tomcat8/webapps/alura-forum.war'

        ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.15 'cp /vagrant/deploy/green/nginx.conf.green /etc/nginx/nginx.conf'
        ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.15 'sudo service nginx reload'

        echo "green" > /home/vagrant/last_deploy

        echo "Deploy concluido com sucesso"

else
        echo "O ultimo deploy foi o green"

        echo "Iniciando o processo de atualização no blue..."

        scp -o StrictHostKeyChecking=no -i /home/vagrant/devops alura-forum-blue.war vagrant@192.168.50.13:/home/vagrant/alura-forum.war
        ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.13 'sudo mv /home/vagrant/alura-forum.war /var/lib/tomcat8/webapps/alura-forum.war'

        ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.15 'cp /vagrant/deploy/blue/nginx.conf.blue /etc/nginx/nginx.conf'
        ssh -o StrictHostKeyChecking=no -i /home/vagrant/devops vagrant@192.168.50.15 'sudo service nginx reload'

        echo "blue" > /home/vagrant/last_deploy

        echo "Deploy concluido com sucesso"
fi