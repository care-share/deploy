# VHA ORH Care-Share Pilot -- Docker Environment

This document details how to deploy the necessary services to run the VHA ORH Care-Share pilot system.

## Prerequisites for Debian/Ubuntu

* [Maven installed](http://www.mkyong.com/maven/how-to-install-maven-in-ubuntu/)
* [Docker installed](http://docs.docker.com/installation/ubuntulinux/)
* [Docker Compose installed](https://docs.docker.com/compose/install/)
* In the parent directory of this repository, clone the following git repositories:
  * [care-share/careauth](https://github.com/care-share/careauth)
  * [care-share/careshare](https://github.com/care-share/careshare)
  * [care-share/hapi-docker](https://github.com/care-share/hapi-docker)
  * [care-share/nomination-service](https://github.com/care-share/https://github.com/care-share/nomination-service)
  * [care-share/vha-rural-health-openid-connect-overlay](https://github.com/care-share/vha-rural-health-openid-connect-overlay)
  * [care-share/transcript-api](https://github.com/care-share/https://github.com/care-share/transcript-api)
* Make sure you do not have any applications running on port 80, 443, 3003, 7293, or 8080
* Use a machine that has at least 8GB of RAM

## Configuration

1. If it doesn't exist, copy the "`common.env.example`" file to create the "`common.env`" file
2. Edit the "`common.env`" file and change settings as desired
3. (Optional) If using TLS encryption, put your private/public keypair in "`careauth/tls/keystore.p12`"

## Running

1. Run the following script to download the latest Git repositories, build WAR files, build new Docker images, and re-deploy Docker containers:

        $ ./deploy_updates.sh

2. Check Docker containers to make sure all four are running:

        $ docker-compose ps

3. Check the following URLs to see the web services:
    * **Care-Share pilot web interface:** http://localhost:80/
    * **HAPI-FHIR JPA server:** http://localhost:8080/

## License

Copyright 2016 The MITRE Corporation, All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
