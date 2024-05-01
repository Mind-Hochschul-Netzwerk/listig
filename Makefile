include .env

.env:
	$(error file .env is missing, see env.sample)

config.yml:
	$(error file config.yml is missing, see config.yml.sample)

dev: .env config.yml
	@echo "Starting DEV Server"
	docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d --force-recreate --remove-orphans

prod: .env config.yml
	@echo "Starting Production Server"
	docker compose up -d --force-recreate --remove-orphans app

upgrade:
	git pull
	make prod

shell:
	docker compose exec app sh

rootshell:
	docker compose exec --user root app sh

logs:
	docker compose logs -f
