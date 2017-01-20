# Rancher CLI Docker Image

This is the Git repo of the Docker image for [lukehowell/rancher-cli]().

## Development

Run `make`.
Rancher will be downloaded and the docker image built.

### Environment Variables

Use environment variables to change build specifications.

* ENTRYPOINT - The entrypoint for the docker image
* VERSION - The Rancher CLI version to install
* IMAGE - The name of the docker image
* TAG - The tag of the docker image