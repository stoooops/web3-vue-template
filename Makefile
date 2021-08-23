all: build web

build:
	docker-compose build

web:
	docker-compose up --force-recreate --remove-orphans
