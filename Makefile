NAME = inception

all: start

start:
	@mkdir -p /home/login/data/mariadb
	@mkdir -p /home/login/data/wordpress
	@ echo "127.0.0.1 tserdet.42.fr" >> /etc/hosts
	@ docker-compose -f srcs/docker-compose.yml up --build
	
stop:
	@ docker-compose -f srcs/docker-compose.yml down

clean: stop
	@rm -rf /home/login/data/mariadb
	@rm -rf /home/login/data/wordpress
	@docker system prune -f
	@docker image prune -af
	@docker volume rm srcs_wordpress
	@docker volume rm srcs_mariadb

