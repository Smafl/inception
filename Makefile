all:
	mkdir -p /home/ekulichk/data/mariadb
	mkdir -p /home/ekulichk/data/wordpress
	docker compose -f srcs/docker-compose.yml -p inception up --build -d --remove-orphans

down:
	docker compose -f ./srcs/docker-compose.yml -p inception down

clean:
	docker compose -f srcs/docker-compose.yml -p inception down --rmi all --volumes --remove-orphans

prune: clean
	docker system prune -af
	rm -rf /home/ekulichk/data/mariadb
	rm -rf /home/ekulichk/data/wordpress

re: prune all

.PHONY: all clean re prune down
