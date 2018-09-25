rm -f app
rm -f foo.hpp
node ./generate-foo.js > foo.hpp
c++ app.cpp -o app 
