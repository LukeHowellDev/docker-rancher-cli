# Rancher CLI Docker Image

Small docker image with Rancher CLI for local use or CI

## Development

To build the docker image you will run `make` and rancher will be downloaded and the docker image built.

Use environment variables to change build specifications.

### Environment Variables

* ENTRYPOINT - The entrypoint for the docker image
* VERSION - The Rancher CLI version to install
* IMAGE - The name of the docker image
* TAG - The tag of the docker image