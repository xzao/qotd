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
