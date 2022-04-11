
COMPOSE_FILE=./srcs/docker-compose.yml

HOST_PRESENT = $(shell cat /etc/hosts | grep ldes-cou.42.fr > /dev/null; echo $$)

all:
ifneq ($(HOST_PRESENT),0)
	@sudo sed -i 's/127.0.0.1	localhost/127.0.0.1	localhost ldes-cou.42.fr/g' /etc/hosts
endif
	@mkdir -p /home/ldes-cou/data/wp_vol
	@mkdir -p /home/ldes-cou/data/db_vol
	@docker-compose -f ${COMPOSE_FILE} build
up:
	@docker-compose -f ${COMPOSE_FILE}  up
clean:
	@docker-compose -f ${COMPOSE_FILE} down
	@sudo rm -rf /home/ldes-cou/data/wp_vol
	@sudo rm -rf /home/ldes-cou/data/db_vol

fclean: clean
	@docker system prune
re: fclean all

.PHONY : all clean fclean re up 
