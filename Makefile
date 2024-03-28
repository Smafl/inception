
include srcs/.env

all:
	mkdir -p /Users/ekulichk/data/mariadb
	mkdir -p /Users/ekulichk/data/wordpress
	docker-compose -f srcs/docker-compose.yml -p inception up --build -d --remove-orphans

clean:
	docker-compose -f srcs/docker-compose.yml -p inception down --rmi all --volumes --remove-orphans

prune: clean
	docker system prune -af
	rm -rf /Users/ekulichk/data/mariadb
	rm -rf /Users/ekulichk/data/wordpress

re: clean all

.PHONY: all clean re
