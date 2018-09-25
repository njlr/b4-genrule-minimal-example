#!/bin/sh
rm -f app
rm -f app.o
rm -f foo.hpp
node ./generate-foo.js > foo.hpp
g++ -I. -c ./src/app.cpp -o app.o 
g++ app.o -o app 
