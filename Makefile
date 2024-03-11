FILE=$(PWD)/srcs/docker-compose.yml

all: up

up:
	sudo docker compose -f $(FILE) up -d --build

clean:
	sudo docker compose -f $(FILE) down;
	sudo docker system prune -fa

fclean: clean
	sudo rm -rf /home/rgomes-c/data/wordpress/*
	sudo rm -rf /home/rgomes-c/data/mysql/*
	docker volume rm $$(docker volume ls -q)

re: fclean all