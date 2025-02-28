# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cauvray <cauvray@student.42lehavre.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/15 22:38:54 by cauvray           #+#    #+#              #
#    Updated: 2025/02/28 22:26:07 by cauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME				=	inception

DOCKER_COMPOSE_CMD	=	docker compose
DOCKER_COMPOSE_PATH	=	srcs/docker-compose.yml

all: up

up:
	@if [ -f "./srcs/.env" ]; then \
		$(DOCKER_COMPOSE_CMD) -p $(NAME) -f $(DOCKER_COMPOSE_PATH) up --build -d; \
	else \
		echo "No .env file found in srcs folder, please create one before running make"; \
	fi

down:
	$(DOCKER_COMPOSE_CMD) -p $(NAME) -f $(DOCKER_COMPOSE_PATH) down -v

stop:
	$(DOCKER_COMPOSE_CMD) -p $(NAME) -f $(DOCKER_COMPOSE_PATH) stop

start:
	$(DOCKER_COMPOSE_CMD) -p $(NAME) -f $(DOCKER_COMPOSE_PATH) start

restart: down all

test:
	docker run -it --rm alpine:3.21.2 sh

.PHONY: test
