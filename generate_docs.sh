#!/bin/bash
./compile.sh
cd jsdoc
java -jar jsrun.jar app/run.js --private -t=templates/jsdoc -d=../docs/client ../website/client/*.js
java -jar jsrun.jar app/run.js --private -t=templates/jsdoc -d=../docs/server ../website/server/*.js
cd ..
