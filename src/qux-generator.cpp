#include <vector>
#include <string>
#include <iostream>
#include <fstream>

int main(int argc, char *argv[]) {
  std::vector<std::string> args(argv, argv + argc);

  if (args.size() < 2) {
    std::cerr << "You must provide a base-name as a command-line argument" << std::endl;

    return 1;
  }

  const std::string baseName = args[1];

  // qux.hpp
  {
    std::ofstream outfile (baseName + ".hpp");

    outfile
      << "#ifndef QUX_HPP" << std::endl
      << "#define QUX_HPP" << std::endl
      << std::endl
      << "int qux(); " << std::endl
      << std::endl
      << "#endif" << std::endl;

    outfile.close();
  }

  // qux.cpp
  {
    std::ofstream outfile (baseName + ".cpp");

    outfile
      << "#include <qux.hpp>" << std::endl
      << std::endl
      << "int qux() {" << std::endl
      << "  return 9;" << std::endl
      << "}" << std::endl
      << std::endl;

    outfile.close();
  }

  return 0;
}
