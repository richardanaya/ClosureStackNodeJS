java -jar closure-tools/SoyToJsSrcCompiler.jar --outputPathFormat static/js/hello.soy.js --shouldGenerateJsdoc --shouldProvideRequireSoyNamespaces static/js/hello.soy 
python closure-tools/closure/bin/build/closurebuilder.py --root closure-tools --root static --namespace "website" --output_mode=compiled --compiler_jar=closure-tools/compiler.jar > static/js/website-compiled.js
