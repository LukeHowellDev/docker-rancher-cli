VERSION ?= v0.4.1
IMAGE ?= lukehowell/rancher-cli
TAG ?= latest
ENTRYPOINT ?=

ifdef ENTRYPOINT
	_ENTRYPOINT := -DENTRYPOINT=$(ENTRYPOINT)
endif

.PHONY: dockerfile

all: clean download dockerfile build

download:
	@wget https://github.com/rancher/cli/releases/download/$(VERSION)/rancher-linux-amd64-$(VERSION).tar.gz
	@tar xf rancher-linux-amd64-$(VERSION).tar.gz
	@mv rancher-$(VERSION)/rancher .
	@rm -rf rancher-*

dockerfile:
	@m4 $(_ENTRYPOINT) Dockerfile.in > Dockerfile
	@cat Dockerfile

build:
	@docker build -t $(IMAGE):$(TAG) .

clean:
	@rm -rf Dockerfile rancher rancher-*

test/with-entrypoint:
	@echo "Testing with Entrypoint of $(ENTRYPOINT)"
	@[ "`docker run $(IMAGE):$(TAG) --version`" == "rancher version $(VERSION)" ] || exit 1

test/without-entrypoint:
	@echo "Testing without Entrypoint"
	@[ "`docker run $(IMAGE):$(TAG) rancher --version`" == "rancher version $(VERSION)" ] || exit 1

deploy:
	@echo "Deploying to Docker Hub $(IMAGE):$(TAG)"
	@docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD)
	@docker push $(IMAGE):$(TAG)
