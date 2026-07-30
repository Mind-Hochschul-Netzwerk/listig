.DEFAULT_GOAL := help

.PHONY: help deploy logs down shell

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-14s\033[0m %s\n", $$1, $$2}'

prod: ## Recreate and start the app container
	docker compose up -d --force-recreate --remove-orphans app

logs: ## Tail logs from all containers
	docker compose logs -f

down: ## Stop and remove containers
	docker compose down

shell: ## Open a shell inside the app container
	docker compose exec app sh
