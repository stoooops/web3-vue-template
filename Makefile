all: build

install:
	rm -rf node_modules/*
	npm install

lint:
	npm run pretty && npm run lint

build:
	docker build -f docker/Dockerfile -t vue-example .

dev: build
	docker-compose -f docker/docker-compose.yaml up --force-recreate --remove-orphans

prod: build
	docker-compose -f docker/docker-compose.production.yaml up --force-recreate --remove-orphans -d

