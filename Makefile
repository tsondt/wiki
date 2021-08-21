.ONESHELL:
.SHELLFLAGS = -e -u

.PHONY: build
build: # Build the Docker image
	sh docker-build.sh

.PHONY: run
run: # Build and run the Docker image
	sh docker-build.sh
	sh docker-run.sh

.PHONY: clean
clean: # Clean up .bundle and Jekyll _site
	rm -f Gemfile.lock
	rm -rf .bundle
	rm -rf _site
	rm -rf .sass-cache
