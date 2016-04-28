Get and merge some OVH API (like https://eu.api.ovh.com/1.0/sms.json) to an Open API description file (Swagger).

## Requirements

### System

Tested on OSX 10.11, but *nix systems should be ok.

### Dependencies

Docker engine must be installed.

## Usage

- Create a `.yaml` file containing metadata about the API and the routes to merge. See into the directory `Examples` to get the yaml structure.

- Build the docker images

```bash
$ make all
```

- Run the script `ovhapi2code.sh` to generate the code source in the language of your choice (but supported by OpenAPI)
The first argument is the path of the `.yaml` file containing metadata, the second argument is the output directory and the third argument is the language of the generated code source.

```bash
$ ovhapi2code.sh ~/ovhapi.yaml ~/output php
```

> Here the directory ~/output will contain the file `openapi.yaml` and a directory `php` containing the PHP code source based on the OVH API.

> By default the internal endpoints are not generated, if you want them add a fourth argument: `-I`.

## Available languages

Open API provides generators for the following languages, but for now only `swift` is supporting the OVH authentication:

- android
- aspnet5
- async-scala
- csharp
- dart
- flash
- python-flask
- go
- java
- jaxrs
- jaxrs-cxf
- jaxrs-resteasy
- inflector
- javascript
- javascript-closure-angular
- jmeter
- nodejs-server
- objc
- perl
- php
- python
- qt5cpp
- ruby
- scala
- scalatra
- silex-PHP
- sinatra
- slim
- spring-mvc
- dynamic-html
- html
- swagger
- swagger-yaml
- swift
- tizen
- typescript-angular
- typescript-node
- akka-scala
- CsharpDotNet2
- clojure
- haskell-servant
