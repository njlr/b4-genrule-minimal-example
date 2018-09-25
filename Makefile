.PHONY: clean

clean:
	rm -rf ./build

./build:
	mkdir -p ./build

./build/foo.hpp: ./build ./scripts/generate-foo-hpp.js
	node ./scripts/generate-foo-hpp.js > ./build/foo.hpp

./build/foo.cpp: ./build ./scripts/generate-foo-cpp.js
	node ./scripts/generate-foo-cpp.js > ./build/foo.cpp

./build/app.o: ./build ./src/app.cpp ./build/foo.hpp 
	g++ -I./build -c ./src/app.cpp -o ./build/app.o 

./build/foo.o: ./build ./build/foo.cpp ./build/foo.hpp
	g++ -I./build -c ./build/foo.cpp -o ./build/foo.o 

./build/app: ./build ./build/app.o ./build/foo.o
	g++ ./build/foo.o ./build/app.o -o ./build/app 
