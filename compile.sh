find website/client/ -name *.soy -exec java -jar closure-tools/SoyToJsSrcCompiler.jar --outputPathFormat {}.js --shouldGenerateJsdoc --shouldProvideRequireSoyNamespaces {} \;
find website/client/ -name *.coffee -exec coffee -c {} \;
find website/server/ -name *.coffee -exec coffee -c {} \;
python closure-tools/closure/bin/build/closurebuilder.py --root closure-tools --root website/client --namespace "website" --output_mode=script --compiler_jar=closure-tools/compiler.jar > website/static/js/website-compiled.js
