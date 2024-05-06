VERSION := $(shell jq -r '.version' info.json)
DIRECTORY := $(shell basename $(CURDIR))
ZIP_FILE := $(DIRECTORY)_$(VERSION).zip

EXCLUDE_FILES := \
	.DS_Store \
	.git\/* \
	.gitignore \
	.vscode\/* \
	*.zip \
	Makefile \
	README.md

# Define the default target
.PHONY: all clean zip

all: clean zip
clean:
	@echo "Cleaning up"
	@rm -f *.zip
	@echo "Done"

zip:
	@echo "Creating $(ZIP_FILE)"
	@mkdir -p temp_zip/$(DIRECTORY)
	@cp -r $(filter-out $(EXCLUDE_FILES), $(wildcard *)) temp_zip/$(DIRECTORY)/
	@cd temp_zip && zip -r ../$(ZIP_FILE) $(DIRECTORY)
	@rm -rf temp_zip
	@echo "Done"
