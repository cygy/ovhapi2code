#!/bin/bash

OVHAPI2OPENAPI_DOCKERCONTAINERNAME="ovh-openapi-filegenerator"
OPENAPI2CODE_DOCKERCONTAINERNAME="ovh-openapi-codegenerator"

if [ "$#" -lt 3 ]; then
    echo "Illegal number of parameters"
    echo "Usage:"
    echo "  $0 [PATH_TO_OVH_API_YAML_FILE] [OUTPUT_PATH] [LANGUAGE]"
    exit 1
fi

if [ "$4" = "-I" ]; then
    EXTRA_ARGS="-I"
else
    EXTRA_ARGS=""
fi

docker rm -f $OVHAPI2OPENAPI_DOCKERCONTAINERNAME $OPENAPI2CODE_DOCKERCONTAINERNAME
docker run --name $OVHAPI2OPENAPI_DOCKERCONTAINERNAME -v $1:/data/api.yaml -v $2:/output ovhapi2openapi $EXTRA_ARGS
docker run --name $OPENAPI2CODE_DOCKERCONTAINERNAME -v $2:/input -v $2:/output openapi2code java -jar modules/swagger-codegen-cli/target/swagger-codegen-cli.jar generate -i /input/openapi.yaml -l $3 -o /output/$3
