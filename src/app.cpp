#include <iostream>

#include <foo.hpp>
#include <bar.hpp>
#include <baz.hpp>
#include <qux.hpp>

int main() {
  std::cout << "foo() = " << foo() << std::endl;
  std::cout << "bar() = " << bar() << std::endl;
  std::cout << "baz() = " << baz() << std::endl;
  std::cout << "qux() = " << qux() << std::endl;

  return 0;
}
