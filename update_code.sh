#!/usr/bin/env bash

git submodule foreach "(git checkout master; git pull; cd ..; git add '$path'; git commit -m 'Submodule Sync')"