#
#   Makefile
#


#
#   env[s]
#
$(shell test -f .env || cp .env.sample .env)
include .env
export $(shell sed 's/=.*//' .env)


#
#   target[s]
#
%:
	@:

build:
	docker-compose build

clean:
	make stop
	docker rmi ${QOTD_IMAGE:-qotd}:${QOTD_VERSION:-latest} || true

develop:
	@echo "Starting nginx development server on http://localhost:7800"
	@sudo nginx -t
	@echo "Nginx starting in foreground. Press Ctrl+C to stop..."
	@sudo nginx -g 'daemon off;'

logs:
	docker-compose logs -f

restart:
	make stop
	make start

shell:
	docker exec -it ${QOTD_CONTAINER_NAME:-qotd} sh

start:
	docker-compose up -d

stop:
	docker-compose down

upgrade:
	docker-compose up -d --force-recreate --build

version:
	@NEW_VERSION="$(filter-out $@,$(MAKECMDGOALS))"; \
	if [ -z "$$NEW_VERSION" ]; then \
		echo "Usage: make version <version>"; \
		echo "Example: make version 1.0.0.0 or make version 1.0.0.0-rc1"; \
		exit 1; \
	fi; \
	if git rev-parse "v$$NEW_VERSION" >/dev/null 2>&1; then \
		echo "Error: Version tag v$$NEW_VERSION already exists."; \
		exit 1; \
	fi; \
	if [ -n "$$(git status --porcelain)" ]; then \
		echo "Error: Working directory is not clean. Please commit or stash your changes."; \
		git status --short; \
		exit 1; \
	fi; \
	echo "$$NEW_VERSION" > VERSION; \
	git add VERSION; \
	git commit -m "Version $$NEW_VERSION"; \
	git tag "v$$NEW_VERSION"; \
	echo "Successfully created version v$$NEW_VERSION"
