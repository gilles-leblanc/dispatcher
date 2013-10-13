# Deploy the generated site to GitHub

# Commit current modifications
git add .
git commit

# Create a temp dir to copy the files while we switch branches
TEMP_CP_DIR="../dispatcher_site_temp"
if [ -d  "$TEMP_CP_DIR" ]; then
  rm -r $TEMP_CP_DIR
fi

mkdir $TEMP_CP_DIR
cp -r site/* $TEMP_CP_DIR

# Switch git branch to branch containing web-page
git checkout gh-pages
cp -rf $TEMP_CP_DIR/* .

# Commit and push new web-page to server (resulting in deployment)
git add .
git commit -m 'Automatic GitHub page update'
git push origin gh-pages
git checkout master

echo Done Deploying
