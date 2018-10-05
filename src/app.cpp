#include <iostream>

#include <foo.hpp>
#include <bar.hpp>
#include <baz.hpp>
#include <qux.hpp>
#include <tux.hpp>
#include <gru.hpp>
#include <soy.hpp>
#include <a+b/mux.hpp>
#include <fob.hpp>

int main() {
  std::cout << "foo() = " << foo() << std::endl;
  std::cout << "bar() = " << bar() << std::endl;
  std::cout << "baz() = " << baz() << std::endl;
  std::cout << "qux() = " << qux() << std::endl;
  std::cout << "tux() = " << tux() << std::endl;
  std::cout << "gru() = " << gru() << std::endl;
  std::cout << "soy() = " << soy() << std::endl;
  std::cout << "mux() = " << mux() << std::endl;
  std::cout << "fob() = " << fob() << std::endl;

  return 0;
}
