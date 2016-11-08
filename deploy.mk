IMAGE_NAME := takesxisximada/docker-alpine
VAULT_ZIP_URL := https://releases.hashicorp.com/vault/0.6.2/vault_0.6.2_linux_amd64.zip
ARCHIVE_DIR := $(CURDIR)/archives
VAULT_ZIP := $(ARCHIVE_DIR)/vault_0.6.2_linux_amd64.zip
VAULT_EXPORT_DIR := build
VAULT_CMD := $(VAULT_EXPORT_DIR)/vault

.PHONY: help
help:
	@unmake $(MAKEFILE_LIST)

.PHONY: build
build: $(VAULT_CMD)
	docker build . --build-arg VAULT=$(VAULT_CMD) --tag $(IMAGE_NAME)

.PHONY: debug
debug:
	docker run -it $(IMAGE_NAME) sh

.PHONY: download
download: $(VAULT_ZIP)
	echo "downloaded"

$(VAULT_ZIP):
	mkdir -p $(ARCHIVE_DIR)
	curl -L $(VAULT_ZIP_URL) -o $(VAULT_ZIP)

$(VAULT_CMD): $(VAULT_ZIP)
	unzip $(VAULT_ZIP) -d $(VAULT_EXPORT_DIR)
