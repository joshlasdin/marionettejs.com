#!/bin/bash

# # Remove the Downloads directory to start with
rm -r dist/downloads

# # Lets create some directories for our download and build targets
# mkdir -p backbone.marionette/core
mkdir -p dist/downloads
mkdir -p tmp/backbone.marionette/core

# We need to download all the files to build the project
curl -L https://raw.github.com/douglascrockford/JSON-js/master/json2.js > tmp/backbone.marionette/json2.js
curl -L http://underscorejs.org/underscore.js > tmp/backbone.marionette/underscore.js
curl -L http://backbonejs.org/backbone.js > tmp/backbone.marionette/backbone.js
curl -L http://code.jquery.com/jquery.js > tmp/backbone.marionette/jquery.js
curl -L https://raw.github.com/marionettejs/backbone.wreqr/master/lib/backbone.wreqr.js > tmp/backbone.marionette/backbone.wreqr.js
curl -L https://raw.github.com/marionettejs/backbone.babysitter/master/lib/backbone.babysitter.js > tmp/backbone.marionette/backbone.babysitter.js

curl -L https://raw.github.com/marionettejs/backbone.marionette/master/lib/backbone.marionette.js > tmp/backbone.marionette/backbone.marionette.js
curl -L https://raw.github.com/marionettejs/backbone.marionette/master/lib/backbone.marionette.min.js > tmp/backbone.marionette/backbone.marionette.min.js
curl -L https://raw.github.com/marionettejs/backbone.marionette/master/lib/backbone.marionette.min.js.map > tmp/backbone.marionette/backbone.marionette.min.js.map

curl -L https://raw.github.com/marionettejs/backbone.marionette/master/lib/core/backbone.marionette.js > tmp/backbone.marionette/core/backbone.marionette.js
curl -L https://raw.github.com/marionettejs/backbone.marionette/master/lib/core/backbone.marionette.min.js > tmp/backbone.marionette/core/backbone.marionette.min.js
curl -L https://raw.github.com/marionettejs/backbone.marionette/master/lib/core/backbone.marionette.min.js.map > tmp/backbone.marionette/core/backbone.marionette.min.js.map

# Lets zip together in tar and zip formats
tar -zcvf backbone.marionette.tar.gz tmp/backbone.marionette/
zip -r backbone.marionette.zip tmp/backbone.marionette/

# Move everything in place
mv tmp/backbone.marionette/* dist/downloads
mv backbone.marionette.tar.gz dist/downloads
mv backbone.marionette.zip dist/downloads

# Remove the old directory that we dont care about
rm -rf tmp
