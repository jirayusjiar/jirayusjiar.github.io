#/bin/bash

rm -rf .git

git init
git add .
git commit -m "First commit"

git remote add origin git@github.com:jirayusjiar/jirayusjiar.github.io.git
git push -u --force origin master
