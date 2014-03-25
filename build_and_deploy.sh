#!/bin/bash

# Generates a new instance of the dispatcher website and then publishes
# it on GitHub and GitHub pages.
#
# If no argument is specified the script will generate all language sub-pages
# An optional single parameter can be supplied to specify a language.
# Allowed values are: ruby, python, java, javascript

bash gensite.sh $1
bash deploysite.sh -a
git push origin master
