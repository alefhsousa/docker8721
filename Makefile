IP_WEB=192.168.50.10
IP_WEB_02=192.168.50.13
NGINX=192.168.50.15
CI=192.168.50.12
SSH=ssh -o StrictHostKeyChecking=no -i infra/ssh-keys/devops
PROJECT_FOLDER=~/caelum/docker8721/do25-alura-forum

ssh/web:
	 $(SSH) vagrant@$(IP_WEB)

ssh/web-02:
	$(SSH) vagrant@$(IP_WEB_02)

ssh/nginx:
	$(SSH) vagrant@$(NGINX)

ssh/ci:
	$(SSH) vagrant@$(CI)


maven/clean:
	cd $(PROJECT_FOLDER) && mvn clean

maven/package: maven/clean
	cd $(PROJECT_FOLDER) && mvn package -DskipTests


vagrant/up:
	cd infra && vagrant up