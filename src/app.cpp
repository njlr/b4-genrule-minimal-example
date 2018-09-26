#include <iostream>
#include <foo.hpp>
#include <bar.hpp>

int main() {
  std::cout << "foo() = " << foo() << std::endl;
  std::cout << "bar() = " << bar() << std::endl;

  return 0;
}
