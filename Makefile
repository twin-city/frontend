SHELL = /bin/bash

export CURRENT_PATH := $(shell pwd)
export APP = twincity-frontend
export APP_VERSION := 0.1

# compose command to merge production file and and dev/tools overrides
export COMPOSE?=docker-compose
export DC_UP_ARGS = --force-recreate #s--build

# FRONTEND
export FRONTEND_PORT=3000
export FRONTEND_HOST = frontend
# NGINX
export PORT = 80
# BUILD OPTIONS
export BUILD_DIR = ${CURRENT_PATH}/${APP}-build
export FILE_FRONTEND_DIST_APP_VERSION = $(APP)-$(APP_VERSION)-frontend-dist.tar.gz


##############
#  FRONTEND  #
##############

frontend-dev-build:
	@echo "Build frontend"
	@$(COMPOSE) -f docker-compose-frontend-dev.yml build $(DC_BUILD_ARGS)

frontend-dev:
	@echo "Listening on port: $(FRONTEND_PORT)"
	@$(COMPOSE) -f docker-compose-frontend-dev.yml up -d $(DC_UP_ARGS)

frontend-dev-exec:
	@echo "Listening on port: $(FRONTEND_PORT)"
	@$(COMPOSE) -f docker-compose-frontend-dev.yml exec frontend-dev sh

frontend-down:
	@$(COMPOSE) -f docker-compose-frontend-dev.yml down


##############
#  NGINX     #
##############

nginx-dev: network
	@$(COMPOSE) -f docker-compose-nginx-dev.yml up -d $(DC_UP_ARGS)
nginx-dev-stop: network
	@$(COMPOSE) -f docker-compose-nginx-dev.yml down
nginx-dev-exec:
	@$(COMPOSE) -f docker-compose-nginx-dev.yml exec nginx-dev bash
nginx-dev-down:
	@$(COMPOSE) -f docker-compose-nginx-dev.yml down
nginx-prod: network
	@$(COMPOSE) -f docker-compose-nginx.yml up -d $(DC_UP_ARGS)
nginx-down:
	@$(COMPOSE) -f docker-compose-nginx.yml down
nginx-dev-exec:
	@$(COMPOSE) -f docker-compose-nginx.yml exec nginx bash

###############
# BUILD STAGE #
###############
build: frontend-build nginx-build backend-build

frontend-build: network frontend-build-dist $(BUILD_DIR)/$(FILE_FRONTEND_DIST_APP_VERSION)

nginx-build:
	@echo building ${APP} nginx
	cp $(BUILD_DIR)/$(FILE_FRONTEND_DIST_APP_VERSION) nginx/
	@$(COMPOSE) -f docker-compose-nginx.yml build $(DC_BUILD_ARGS)

frontend-build-dist:
	@echo building ${APP} frontend in ${FRONTEND}
	@$(COMPOSE) -f docker-compose-frontend-build.yml build $(DC_BUILD_ARGS)


build-dir:
	@if [ ! -d "$(BUILD_DIR)" ] ; then mkdir -p $(BUILD_DIR) ; fi

$(BUILD_DIR)/$(FILE_FRONTEND_DIST_APP_VERSION): build-dir
	@$(COMPOSE) -f docker-compose-frontend-build.yml run -T frontend-build sh -c "npm run build > /dev/null 2>&1 && tar czf - public -C /app" > $(BUILD_DIR)/$(FILE_FRONTEND_DIST_APP_VERSION)

##############
#  GENERAL   #
##############

dev: frontend-dev nginx-dev
down: frontend-down nginx-dev-down

up: nginx-prod
stop: nginx-down
