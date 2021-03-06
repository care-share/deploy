#!/usr/bin/env bash

# Get full directory where this script is stored
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Ensure that prerequisites exist
if ! type "mvn" > /dev/null; then
  ERR="Maven is not installed"
elif ! type "docker" > /dev/null; then
  ERR="Docker is not installed"
elif ! type "docker-compose" > /dev/null; then
  ERR="Docker Compose is not installed"
elif [ ! -d "$DIR/careshare" ]; then
  ERR="'$(readlink -f $DIR/careshare)' repo not found"
elif [ ! -d "$DIR/careauth" ]; then
  ERR="'$(readlink -f $DIR/careauth)' repo not found"
elif [ ! -d "$DIR/fhir" ]; then
  ERR="'$(readlink -f $DIR/fhir)' repo not found"
elif [ ! -d "$DIR/openid" ]; then
  ERR="'$(readlink -f $DIR/openid)' repo not found"
elif [ ! -d "$DIR/nomination-service" ]; then
  ERR="'$(readlink -f $DIR/nomination-service)' repo not found"
elif [ ! -d "$DIR/transcript-api" ]; then
  ERR="'$(readlink -f $DIR/transcript-api)' repo not found"
fi

# If we encountered an error, inform the user and exit
if [ ! -z "$ERR" ]; then
  tput setaf 1 # set foreground color to red
  echo "Error: $ERR! Exiting..."
  tput sgr0 # reset text format to the terminal's default
  exit 1
fi

# If the common.env file doesn't exist, create it
if [ ! -f "$DIR/common.env" ]; then
  tput setaf 3 # set foreground color to yellow
  echo "'$DIR/common.env' does not exist, creating it now..."
  echo "Edit that file and re-run this script to continue!"
  tput sgr0 # reset text format to the terminal's default
  cp "$DIR/common.env.example" "$DIR/common.env"
  exit 2
fi

# Update git repos
git pull # update this repo
cd "$DIR/careshare"
git pull # update careshare
cd "$DIR/careauth"
git pull # update careauth
cd "$DIR/fhir"
git pull # update hapi-docker
cd "$DIR/openid"
git pull # update vha-rural-health-openid-connect-overlay
cd "$DIR/nomination-service"
git pull # update nomination-service
cd "$DIR/transcript-api"
git pull # update transcript-api

# Compile OpenID server WAR
cd "$DIR/openid"
mvn clean install

# Compile HAPI-FHIR JPA server WAR
cd "$DIR/fhir/hapi-fhir-jpaserver-example"
mvn clean install

# build new Docker images if needed
cd "$DIR"
docker-compose build

# create new Docker containers and run them in detached mode
docker-compose up -d
