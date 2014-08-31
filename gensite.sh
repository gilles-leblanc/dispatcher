#!/bin/bash

# Shell script to automate the creation of the web site
# The script accepts an optional single parameter that define for which
# language to generate the pages.

function generate_language_page
{
  echo Generating page for $1
  ruby gen_repos.rb $1 > ../site/_includes/$1_repos.html
}

# Generate the project pages for the different languages
cd lib/

if [[ "$1" != "" ]]
then
  generate_language_page $1
else
  generate_language_page ruby
  generate_language_page python
  generate_language_page javascript
  generate_language_page php
fi

cd ../site

# Do a jekyll build to be able to preview the site locally
echo Building site
jekyll build
cd ..

echo Site creation done
