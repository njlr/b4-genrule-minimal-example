#!/bin/sh
rm -rf ./build
mkdir -p ./build
node `pwd`/scripts/generate-tux-hpp.js > `pwd`/build/tux.hpp
node ./scripts/generate-foo-hpp.js > ./build/foo.hpp
node ./scripts/generate-foo-cpp.js > ./build/foo.cpp
node ./scripts/generate-bars.js ./build/bar
g++ ./src/baz-generator.cpp -o ./build/baz-generator 
./build/baz-generator > ./build/baz.hpp
g++ ./src/qux-generator.cpp -o ./build/qux-generator 
./build/qux-generator ./build/qux
node ./scripts/generate-gru-hpp-1.js > ./build/gru.hpp 
node ./scripts/generate-gru-hpp-2.js >> ./build/gru.hpp 
g++ -I./build -c ./build/foo.cpp -o ./build/foo.o 
g++ -I./build -c ./build/bar.cpp -o ./build/bar.o 
g++ -I./build -c ./build/qux.cpp -o ./build/qux.o 
g++ -I./build -isystem./include-system -c ./src/app.cpp -o ./build/app.o 
g++ ./build/foo.o ./build/bar.o ./build/qux.o ./build/app.o -o ./build/app 
