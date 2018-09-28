#include <iostream>

#include <foo.hpp>
#include <bar.hpp>
#include <baz.hpp>

int main() {
  std::cout << "foo() = " << foo() << std::endl;
  std::cout << "bar() = " << bar() << std::endl;
  std::cout << "baz() = " << baz() << std::endl;

  return 0;
}
