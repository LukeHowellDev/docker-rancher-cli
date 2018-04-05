> This is no longer maintained. Since you can specify `entrypoint: []` in `gitlab-ci.yml`. Instead use [rancher/cli](https://hub.docker.com/r/rancher/cli/).

# Docker - Rancher CLI

This image is built from `scratch` so it is as small as possible with the Rancher CLI.

## Usage
```bash
docker run -e RANCHER_URL={URL} -e RANCHER_ACCESS_KEY={ACCESS_KEY} -e RANCHER_SECRET_KEY={SECRET_KEY} lukehowell/rancher-cli --version
```
If using in a CI such as GitLab CI use the `no-entrypoint` tag.