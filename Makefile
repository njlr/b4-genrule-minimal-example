.PHONY: clean 
.DEFAULT_GOAL := ./build/app

clean:
	rm -rf ./build

./build:
	mkdir -p ./build

./build/bar.hpp ./build/bar.cpp: ./build ./scripts/generate-bars.js
	node ./scripts/generate-bars.js ./build/bar 

./build/foo.hpp: ./build ./scripts/generate-foo-hpp.js
	node ./scripts/generate-foo-hpp.js > ./build/foo.hpp 

./build/foo.cpp: ./build ./scripts/generate-foo-cpp.js
	node ./scripts/generate-foo-cpp.js > ./build/foo.cpp 

./build/app.o: ./build ./src/app.cpp ./build/foo.hpp ./build/bar.hpp 
	g++ -I./build -c ./src/app.cpp -o ./build/app.o 

./build/foo.o: ./build ./build/foo.cpp ./build/foo.hpp
	g++ -I./build -c ./build/foo.cpp -o ./build/foo.o 

./build/bar.o: ./build ./build/bar.cpp ./build/bar.hpp
	g++ -I./build -c ./build/bar.cpp -o ./build/bar.o 

./build/app: ./build ./build/app.o ./build/foo.o ./build/bar.o
	g++ ./build/foo.o ./build/bar.o ./build/app.o -o ./build/app 
