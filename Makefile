DOCKER_IMAGE=$(notdir $(CURDIR))
DOCKERFILE_BASE=docker/Dockerfile
DOCKER_COMPOSE_DEV=docker/docker-compose.yaml
DOCKER_COMPOSE_PROD=docker/docker-compose.production.yaml

all: build

uninstall:
	rm -rf dist/*
	rm -rf node_modules/*

install: uninstall
	npm install

lint:
	npm run pretty
	npm run lint

build_base:
	docker build -f $(DOCKERFILE_BASE) -t $(DOCKER_IMAGE) .

build_dev: build_base
	docker-compose -p $(DOCKER_IMAGE) -f $(DOCKER_COMPOSE_DEV) build

build_prod: build_base
	docker-compose -p $(DOCKER_IMAGE) -f $(DOCKER_COMPOSE_PROD) build

build: build_dev build_prod

dev: build_dev
	docker-compose -f $(DOCKER_COMPOSE_DEV) up --force-recreate --remove-orphans

prod: build_prod
	docker-compose -f $(DOCKER_COMPOSE_PROD) up --force-recreate --remove-orphans -d

stop_prod:
	docker stop $(DOCKER_IMAGE)_prod

nuke_docker:
	docker image rm -f $(DOCKER_IMAGE)_dev 2>/dev/null
	docker image rm -f $(DOCKER_IMAGE)_prod 2>/dev/null
	docker image rm -f $(DOCKER_IMAGE) 2>/dev/null
	docker system prune -f
