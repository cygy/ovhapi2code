Use code to build applications from the OVH APIs.

## Requirements

### System

Tested on OSX 10.11, but *nix systems should be ok.

### Dependencies

Docker engine must be installed.

## Usage

- Create a `.yaml` file containing metadata about the API and the routes to merge. See into the directory `Examples` to get the yaml structure: you only need to edit the properties `api/path` and `api/routes`.

- Build the docker images used to generate the code

```bash
$ make all
```

- Run the script `ovhapi2code.sh` to generate the code to a language supported by this script (see the list below).

```bash
$ ovhapi2code.sh ~/ovhapi.yaml ~/output swift
```

> The first argument is the path of the `.yaml` file containing metadata, the second argument is the output directory and the third argument is the language of the generated code.

> Here the directory ~/output will contain the file `openapi.yaml` and a directory `swift` containing the code source in `Swift` based on the OVH API.

### Available languages

OpenAPI provides generators for many languages, but for now only `swift` is supporting the OVH authentication.

### Available APIs

Into your `.yaml` file you can provide one of these URLs to the property `api/path`:

- OVH Europe: [https://eu.api.ovh.com/1.0](https://eu.api.ovh.com/1.0)

- OVH North America: [https://ca.api.ovh.com/1.0](https://ca.api.ovh.com/1.0)

- So you Start Europe: [https://eu.api.soyoustart.com/1.0](https://eu.api.soyoustart.com/1.0)

- So you Start North America: [https://ca.api.soyoustart.com/1.0](https://ca.api.soyoustart.com/1.0)

- Kimsufi Europe: [https://eu.api.kimsufi.com/1.0](https://eu.api.kimsufi.com/1.0)

- Kimsufi North America: [https://ca.api.kimsufi.com/1.0](https://ca.api.kimsufi.com/1.0)

- Runabove: [https://api.runabove.com/1.0](https://api.runabove.com/1.0)

### Available routes

OVH APIs are heavy so you must provide only the routes that you need to the property `api/routes`.

If no route is provided, all the routes of the API will be merged.

You can find the available routes at:

- OVH Europe: [https://eu.api.ovh.com/console](https://eu.api.ovh.com/console)

- OVH North America: [https://ca.api.ovh.com/console](https://ca.api.ovh.com/console)

- So you Start Europe: [https://eu.api.soyoustart.com/console](https://eu.api.soyoustart.com/console)

- So you Start North America: [https://ca.api.soyoustart.com/console](https://ca.api.soyoustart.com/console)

- Kimsufi Europe: [https://eu.api.kimsufi.com/console](https://eu.api.kimsufi.com/console)

- Kimsufi North America: [https://ca.api.kimsufi.com/console](https://ca.api.kimsufi.com/console)

- Runabove: [https://api.runabove.com/console](https://api.runabove.com/console)

### Application key and secret

In order to use the OVH APIs you must create credentials for your application.

- OVH Europe: [https://eu.api.ovh.com/createApp/](https://eu.api.ovh.com/createApp/)

- OVH North America: [https://ca.api.ovh.com/createApp/](https://ca.api.ovh.com/createApp/)

- So you Start Europe: [https://eu.api.soyoustart.com/createApp/](https://eu.api.soyoustart.com/createApp/)

- So you Start North America: [https://ca.api.soyoustart.com/createApp/](https://ca.api.soyoustart.com/createApp/)

- Kimsufi Europe: [https://eu.api.kimsufi.com/createApp/](https://eu.api.kimsufi.com/createApp/)

- Kimsufi North America: [https://ca.api.kimsufi.com/createApp/](https://ca.api.kimsufi.com/createApp/)

- Runabove: [https://api.runabove.com/createApp/](https://api.runabove.com/createApp/)

### Consumer authentication

To get or update informations about an OVH/SYS/KS/RunAbove product/account, you must ask a consumer key.

You are responsible to ask this consumer key and to present the validation page into your application, so do not forget to include the route `/auth` to the property `api/routes` of your `.yaml` file.

Read more at the [OVH API documentation](https://eu.api.ovh.com/g934.first_step_with_api).
