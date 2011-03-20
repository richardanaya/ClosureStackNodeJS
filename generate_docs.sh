#!/bin/bash
cd jsdoc
java -jar jsrun.jar app/run.js --private -t=templates/jsdoc -d=../docs ../website/src/*.js
cd ..
