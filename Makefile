.PHONY: build
build:
	docker build \
	-t pangeo/pangeo-forge-beam-images:$(version) \
	-f ./Dockerfile \
	--build-arg PANGEO_FORGE_VERSION=$(version) \
	--platform linux/amd64 \
	./

.PHONY: push
push:
	docker push pangeo/pangeo-forge-beam-images:$(version)
