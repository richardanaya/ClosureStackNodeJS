find website/client/ -name *.soy -exec java -jar closure-tools/SoyToJsSrcCompiler.jar --outputPathFormat {}.js --shouldGenerateJsdoc --shouldProvideRequireSoyNamespaces {} \;
find website/client/ -name *.coffee -exec coffee -c {} \;
find website/server/ -name *.coffee -exec coffee -c {} \;
python closure-tools/closure/bin/build/closurebuilder.py --root closure-tools --root website/client --namespace "website" --output_mode=compiled --compiler_jar=closure-tools/compiler.jar --compiler_flags="--compilation_level=ADVANCED_OPTIMIZATIONS" > website/static/js/website-compiled.js
