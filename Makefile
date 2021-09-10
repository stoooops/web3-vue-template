all: build

build:
	docker build -f docker/Dockerfile -t vue-example .

lint:
	npm run pretty && npm run lint

dev: build
	docker-compose -f docker/docker-compose.yaml up --force-recreate --remove-orphans

prod: build
	docker-compose -f docker/docker-compose.production.yaml up --force-recreate --remove-orphans -d

