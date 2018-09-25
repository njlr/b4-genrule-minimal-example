.PHONY: clean

clean:
	rm -f app
	rm -f app.o
	rm -f foo.hpp

foo.hpp: generate-foo.js
	node ./generate-foo.js > foo.hpp

app.o: ./src/app.cpp foo.hpp
	g++ -I. -c ./src/app.cpp -o app.o 

app: app.o
	g++ app.o -o app 
