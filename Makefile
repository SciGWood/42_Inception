COMPOSE = docker compose -f ./srcs/docker-compose.yml

all:
	@sudo mkdir -p /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress
	${COMPOSE} up -d --build

stop:
	${COMPOSE} stop

clean: stop
	${COMPOSE} down

prune: clean
	@docker system prune -af
	@sudo rm -rf /home/$(USER)/data/mariadb/ /home/$(USER)/data/wordpress/
	${COMPOSE} down -v

re: clean all

.PHONY: all stop clean prune re
