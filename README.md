# VHA Rural Health Docker Environment

This document details how to deploy the necessary services to run the VHA Rural Health app.

## Prerequisites for Debian/Ubuntu

* [Maven installed](http://www.mkyong.com/maven/how-to-install-maven-in-ubuntu/)
* [Docker installed](http://docs.docker.com/installation/ubuntulinux/)
* [Docker Compose installed](https://docs.docker.com/compose/install/)
* Make sure you do not have any applications running on port 80, 8080, or 8888
* Use a machine that has at least 2GB of RAM

## Configuration

1. Edit the "`common.env`" file and change settings as desired

## Running

1. Download the latest code and compile server WAR files:

        $ ./update_code.sh

2. Build/rebuild Docker images:

        $ docker-compose build

3. Start/restart Docker containers in detached mode:

        $ docker-compose up -d

4. Check Docker containers to make sure all four are running:

        $ docker-compose ps

5. Check the following URLs to see the web services:
    * **HAPI-FHIR JPA server:** http://localhost:8080/hapi-fhir/
    * **OpenID server:** http://localhost:8888/openid/
    * **Rural Health app:** http://localhost:80/

