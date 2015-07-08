#!/usr/bin/env bash

# Download submodules, initializing them if necessary
#git submodule foreach "(git checkout master; git pull)"
git submodule update --init

# Ensure that Maven is installed
if ! type "mvn" > /dev/null; then
  echo "Error: Maven is not installed! Exiting..."
  exit 1
fi

# Compile OpenID server WAR
cd "vha-rural-health-openid-connect-overlay"
mvn clean install
cd "../"

# Compile HAPI-FHIR JPA server WAR
cd "hapi-docker/hapi-fhir-jpaserver-example"
mvn clean install
cd "../../"


