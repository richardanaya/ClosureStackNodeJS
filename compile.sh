find website/client/ -name *.soy -exec java -jar closure-tools/SoyToJsSrcCompiler.jar --outputPathFormat {}.js --shouldGenerateJsdoc --shouldProvideRequireSoyNamespaces {} \;
python closure-tools/closure/bin/build/closurebuilder.py --root closure-tools --root website/client --namespace "website" --output_mode=script --compiler_jar=closure-tools/compiler.jar > website/static/js/website-compiled.js
