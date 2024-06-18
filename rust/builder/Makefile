-include ../../rules.mk

PLATFORMS = linux/amd64,linux/arm64/v8
REPO=ggahlot

.PHONY: all
all: rust-builder-img rust-builder-1.78-img

rust-builder-img-buildargs:= --build-arg RUST_VERSION=1.78

rust-builder-1.78-img-buildargs:= --build-arg RUST_VERSION=1.78

rust-builder-img: Dockerfile

rust-builder-1.78-img: Dockerfile
