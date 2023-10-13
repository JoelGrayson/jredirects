#!/bin/bash

echo "Downloading jredirects.tgz from joelgrayson.com/software/create-joel-app/jredirects.tgz"
curl -L https://joelgrayson.com/software/create-joel-app/jredirects.tgz -o jredirects.tgz
tar -xf jredirects.tgz
rm jredirects.tgz

mv jredirects/next.config.js .

# Make `npm run jredirects` script
jq ".scripts.jredirects=\"cd jredirects && ./build.sh\"" package.json > tmp; cat tmp > package.json; rm tmp;

# Initial creation of jredirects folder
npm run jredirects

