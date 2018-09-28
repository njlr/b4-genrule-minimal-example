#include <iostream>

int main() {
  std::cout 
    << "#ifndef BAZ_HPP" << std::endl
    << "#define BAZ_HPP" << std::endl
    << std::endl
    << "int baz() {" << std::endl
    << "  return 4;" << std::endl
    << "}" << std::endl
    << std::endl
    << "#endif" << std::endl;

  return 0;
}
