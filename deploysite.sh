#!/bin/bash

# Deploy the generated site to GitHub

if [ -s site/_includes/java_repos.html ] &&
  [ -s site/_includes/javascript_repos.html ] &&
  [ -s site/_includes/ruby_repos.html ] &&
  [ -s site/_includes/python_repos.html ]
then
  echo "Start deploying"
else
  echo "Error: missing language pages"
  exit 1
fi

# Commit current modifications
git checkout master
git add .
# Check for -a, automatic command line option
if [ $1 = -a ]; then
  git commit -m 'Automatic GitHub page update'
else
  git commit
fi

# Create a temp dir to copy the files while we switch branches
TEMP_CP_DIR="../dispatcher_site_temp"
if [ -d  "$TEMP_CP_DIR" ]; then
  rm -rf $TEMP_CP_DIR
fi

mkdir $TEMP_CP_DIR
cp -rf site/* $TEMP_CP_DIR

# Switch git branch to branch containing web-page
git checkout gh-pages
cp -rf $TEMP_CP_DIR/* .

# Commit and push new web-page to server (resulting in deployment)
git add .
git commit -m 'Automatic GitHub page update'
git push --force origin gh-pages
git checkout master

echo Done Deploying
