#!/bin/bash
set -x 

git pull

git config --global user.name veretennikovalexey
git config --global user.email raidex@yandex.ru

mkdocs gh-deploy

git add .
git commit -m alex
git push origin main

pause