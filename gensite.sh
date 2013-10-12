# Shell script to automate the creation of the web site

# Generate the project pages for the different languages
cd lib/
ruby gen_repos.rb ruby > ../site/_includes/ruby_repos.html
ruby gen_repos.rb python > ../site/_includes/python_repos.html
ruby gen_repos.rb javascript > ../site/_includes/javascript_repos.html
ruby gen_repos.rb java > ../site/_includes/java_repos.html
cd ../site

# Do a jekyll build to be able to preview the site locally
jekyll build
cd ..

echo Site creation done
