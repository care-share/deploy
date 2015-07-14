# VHA Rural Health Docker Environment

This document details how to deploy the necessary services to run the VHA Rural Health app.

## Prerequisites for Debian/Ubuntu

* [Maven installed](http://www.mkyong.com/maven/how-to-install-maven-in-ubuntu/)
* [Docker installed](http://docs.docker.com/installation/ubuntulinux/)
* [Docker Compose installed](https://docs.docker.com/compose/install/)
* In the parent directory of this repository, clone the following git repositories:
 * `vha-rural-health-pilot/careshare`
 * `vha-rural-health-pilot/hapi-docker`
 * `vha-rural-health-pilot/vha-rural-health-openid-connect-overlay`
* Make sure you do not have any applications running on port 80, 8080, or 8888
* Use a machine that has at least 2GB of RAM

## Configuration

1. If it doesn't exist, copy the "`common.env.example`" file to create the "`common.env`" file
2. Edit the "`common.env`" file and change settings as desired

## Running

1. Run the following script to download the latest Git repositories, build WAR files, build new Docker images, and re-deploy Docker containers:

        $ ./deploy_updates.sh

2. Check Docker containers to make sure all four are running:

        $ docker-compose ps

3. Check the following URLs to see the web services:
    * **HAPI-FHIR JPA server:** http://localhost:8080/hapi-fhir/
    * **OpenID server:** http://localhost:8888/openid/
    * **Rural Health Careshare app:** http://localhost:80/

