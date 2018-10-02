.PHONY: clean 
.DEFAULT_GOAL := ./build/app

pwd := $(shell pwd)

clean:
	rm -rf ./build

./build:
	mkdir -p ./build

./build/bar.hpp ./build/bar.cpp: ./build ./scripts/generate-bars.js
	node ./scripts/generate-bars.js ./build/bar 

./build/baz-generator.o: ./build ./src/baz-generator.cpp
	g++ -c ./src/baz-generator.cpp -o ./build/baz-generator.o

./build/baz-generator: ./build/baz-generator.o
	g++ ./build/baz-generator.o -o ./build/baz-generator

./build/qux-generator.o: ./build ./src/qux-generator.cpp
	g++ -c ./src/qux-generator.cpp -o ./build/qux-generator.o

./build/qux-generator: ./build ./build/qux-generator.o
	g++ ./build/qux-generator.o -o ./build/qux-generator

./build/qux.hpp ./build/qux.cpp: ./build ./build/qux-generator
	./build/qux-generator ./build/qux

./build/baz.hpp: ./build ./build/baz-generator
	./build/baz-generator > ./build/baz.hpp

./build/foo.hpp: ./build ./scripts/generate-foo-hpp.js
	node ./scripts/generate-foo-hpp.js > ./build/foo.hpp 

./build/foo.cpp: ./build ./scripts/generate-foo-cpp.js
	node ./scripts/generate-foo-cpp.js > ./build/foo.cpp 

./build/tux.hpp: ./build ./scripts/generate-tux-hpp.js
	node  $(pwd)/scripts/generate-tux-hpp.js > $(pwd)/build/tux.hpp

./build/gru.hpp: ./build ./scripts/generate-gru-hpp-1.js ./scripts/generate-gru-hpp-2.js 
	node ./scripts/generate-gru-hpp-1.js > ./build/gru.hpp 
	node ./scripts/generate-gru-hpp-2.js >> ./build/gru.hpp 

./build/app.o: ./build ./src/app.cpp ./build/foo.hpp ./build/bar.hpp ./build/baz.hpp ./build/qux.hpp ./build/tux.hpp ./build/gru.hpp
	g++ -I./build -c ./src/app.cpp -o ./build/app.o 

./build/qux.o: ./build ./build/qux.cpp ./build/qux.hpp
	g++ -I./build -c ./build/qux.cpp -o ./build/qux.o 

./build/foo.o: ./build ./build/foo.cpp ./build/foo.hpp
	g++ -I./build -c ./build/foo.cpp -o ./build/foo.o 

./build/bar.o: ./build ./build/bar.cpp ./build/bar.hpp
	g++ -I./build -c ./build/bar.cpp -o ./build/bar.o 

./build/app: ./build ./build/app.o ./build/foo.o ./build/bar.o ./build/qux.o 
	g++ ./build/foo.o ./build/bar.o ./build/qux.o ./build/app.o -o ./build/app 
