This project and it's web site is no longer being maintained.

dispatcher
==========

## Find potential GitHub projects to contribute to.

Dispatcher is a website that uses the GitHub API to search repos and present those which seem like a good fit to begin contributing to. It was initially created to help me find repos to contribute to on a tight time budget. While looking for such repos I realized this can be harder than it seems. While Dispatcher can't guarantee results, it will help shorten the time it takes to find these repos.

These results can be accessed through a GitHub Page.

Dispatcher looks at several factors all of which are configurable. The goal of the standard configuration is to find active repos with open issues that have accepted pull requests in the past and that do not have too many uncommented open pull requests.

## Project Page

<the site is now deprecated>

## Contributing

Please feel free to submit issues, pull request or comments (my email adress is on my GitHub profile).

## Generating pages

To generate a new set of pages use ```gensite.sh``` and ```deploysite.sh``` to deploy them to GitHub. ```build_and_deploy.sh``` does both. On first getting the repository, you will have to do a ```bundle install``` in the /lib folder.

The scripts are configured to deploy to the master repository and will need to be modified to deploy to a fork. They are also configured to use a .netrc file for GitHub configuration.
