
include srcs/.env
export

all:
	mkdir -p /Users/elenakulichkova/data/mariadb
	mkdir -p /Users/elenakulichkova/data/wordpress
	docker-compose -f srcs/docker-compose.yml -p inception up --build -d --remove-orphans

clean:
	docker-compose -f srcs/docker-compose.yml -p inception down --rmi all --volumes --remove-orphans

prune: clean
	docker system prune -af
	rm -rf /Users/elenakulichkova/data/mariadb
	rm -rf /Users/elenakulichkova/data/wordpress

re: clean all

.PHONY: all clean re
