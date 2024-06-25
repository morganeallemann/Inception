# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: smonte-e <smonte-e@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/06 03:08:46 by sab               #+#    #+#              #
#    Updated: 2024/06/05 23:03:48 by smonte-e         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR := ./srcs
DOCKER_COMPOSE_FILE := docker-compose.yml

build:
	@echo "Construction des images Docker..."
	docker-compose -f $(SRC_DIR)/$(DOCKER_COMPOSE_FILE) build

up:
	@echo "Démarrage des conteneurs..."
	docker-compose -f $(SRC_DIR)/$(DOCKER_COMPOSE_FILE) up -d

down:
	@echo "Arrêt et suppression des conteneurs..."
	docker-compose -f $(SRC_DIR)/$(DOCKER_COMPOSE_FILE) down

nuke:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

re:
	make down; make build; make up;

help:
	@echo "Utilisation : make [commande]"
	@echo "Commandes :"
	@echo "  build   : Construire les images Docker"
	@echo "  up      : Démarrer les conteneurs"
	@echo "  down    : Arrêter et supprimer les conteneurs"
	@echo "  nuke    : Tout supprimer ce qu'a installé Docker"
	@echo "  re      : make down, build and up"
	@echo "  help    : Afficher ce message d'aide"


.DEFAULT_GOAL := help

