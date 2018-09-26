const fs = require('fs');

const fileName = process.argv[2];

if (!fileName) {
  throw new Error('You must specify a base file-name as CLI argument. ');
}

const hpp = `#ifndef FOO_HPP
#define FOO_HPP

int foo();

#endif
`;

fs.writeFileSync(fileName + '.hpp', hpp);

const cpp = `#include <foo.hpp>

int foo() {
  return 7;
}
`;

fs.writeFileSync(fileName + '.cpp', cpp);
