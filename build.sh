#!/bin/sh
rm -rf ./build
mkdir -p ./build
node ./scripts/generate-foo-hpp.js > ./build/foo.hpp
node ./scripts/generate-foo-cpp.js > ./build/foo.cpp
g++ -I./build -c ./build/foo.cpp -o ./build/foo.o 
g++ -I./build -c ./src/app.cpp -o ./build/app.o 
g++ ./build/foo.o ./build/app.o -o ./build/app 
