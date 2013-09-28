#!/bin/bash

password=$(<login.pwd)
curl -u gilles-leblanc:$password https://api.github.com/repos/twbs/bootstrap
