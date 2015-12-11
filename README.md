# Docker setup for tapiriik

*tapiriik* ([website](https://tapiriik.com), [GithHub
repo](https://github.com/cpfair/tapiriik)) is an open source web application that
keeps fitness activities across services in sync.

This is an attempt to run the entire tapiriik stack in Docker containers.

## Running locally

Requirements:

- Docker Compose version 1.5
- TCP port 8000 unused on localhost

Preparations:

- Clone this repository
- Copy `environment.example` to `environment`
- Edit `environment`
	- Set the host part of `WEB_ROOT` to the ip address Docker host (eg.
		`docker-machine ip default`)
	- Add your own api credentials for all the services you want to use (see [
		local_settings.py](local_settings.py) to figure out what's configurable)
	- Add credential tore keys with the following command: `docker run
		salomvary/tapiriik-docker:latest python3 credentialstore_keygen_hex.py >>
		environment`

Starting the services:

```
docker-compose up
```

Now navigate your browser th the previously configured `WEB_ROOT`.
