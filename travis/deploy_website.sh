#!/bin/bash

builddir=$1
destdir=$2


git clone git@github.com:OSGeo/proj.4.git $destdir/projdocs
cd $destdir/projdocs
git checkout gh-pages


cd $builddir/html
cp -rf * $destdir/projdocs
cp $builddir/latex/proj.pdf $destdir/projdocs

cd $destdir/projdocs
git config user.email "proj4bot@proj4.bot"
git config user.name "proj.4 deploybot"


git add -A
git commit -m "update with results of commit https://github.com/OSGeo/proj.4/commit/$TRAVIS_COMMIT"
git push origin gh-pages

