DOCKER=docker
GIT=git
OVHAPI2OPENAPI_DOCKER_IMAGE_NAME=ovhapi2openapi
OPENAPICODEGEN_DOCKER_IMAGE_NAME=openapi2code
DOCKERFILES_PATH=./dockerfiles

all: build

clean: cleanimages

build: cleanimages buildimages

buildimages: buildimage_ovhapi2openapi buildimage_openapi2code

cleanimages:
	$(DOCKER) rmi -f $(OVHAPI2OPENAPI_DOCKER_IMAGE_NAME) $(OPENAPICODEGEN_DOCKER_IMAGE_NAME) || true

buildimage_ovhapi2openapi:
	$(DOCKER) build -t $(OVHAPI2OPENAPI_DOCKER_IMAGE_NAME) -f $(DOCKERFILES_PATH)/$(OVHAPI2OPENAPI_DOCKER_IMAGE_NAME) .

buildimage_openapi2code:
	$(DOCKER) build -t $(OPENAPICODEGEN_DOCKER_IMAGE_NAME) -f $(DOCKERFILES_PATH)/$(OPENAPICODEGEN_DOCKER_IMAGE_NAME) .
