dc=docker-compose -f docker-compose.yml $(1)
dc-run=$(call dc, run --rm octo_search $(1))

usage:
	@echo "Available targets:"
	@echo "  * setup        - Initiates everything (building images, fetching deps)"
	@echo "  * build        - Build image"
	@echo "  * dev          - Runs the console"
	@echo "  * up           - Runs the server"
	@echo "  * tear-down    - Removes all the containers and tears down the setup"
	@echo "  * stop         - Stops the server"
	@echo "  * test         - Runs the tests"

setup: build update-deps
update-deps: bundle

build:
	$(call dc, build)
bundle:
	$(call dc-run, bundle install)
dev:
	$(call dc-run, ash)
up:
	$(call dc, up)
tear-down:
	$(call dc, down)
stop:
	$(call dc, stop)

.PHONY: test
test:
	$(call dc-run, bundle exec rspec)
