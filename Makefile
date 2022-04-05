
COMPOSE_FILE=./srcs/docker-compose.yml

build:
		@docker-compose -f ${COMPOSE_FILE} build

up:
		@docker-compose -f  ${COMPOSE_FILE}  up
restart:
		@docker-compose -f 	${COMPOSE_FILE} stop
		@docker-compose -f  ${COMPOSE_FILE} up	
all:
		@build up
debug:
		@docker-compose -f ${COMPOSE_FILE} exec nginx bash 
clean:
		@docker-compose -f  ${COMPOSE_FILE}  stop
		@docker sytem prune
fclean:
		clean

re:
		fclean all