PROJECT = $(shell basename $(shell pwd))
ID = pikesley/${PROJECT}

build:
	docker build \
		--tag ${ID} .

run:
	docker run \
		--name ${PROJECT} \
		--hostname ${PROJECT} \
		--volume $(shell pwd):/opt/${PROJECT} \
		--publish 8000:8000 \
		--interactive \
		--tty \
		--rm \
		${ID} \
		bash

serve:
	bundle exec rackup -p 8000 -o 0.0.0.0
