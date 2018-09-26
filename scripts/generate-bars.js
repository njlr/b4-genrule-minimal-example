const fs = require('fs');

const fileName = process.argv[2];

if (!fileName) {
  throw new Error('You must specify a base file-name as CLI argument. ');
}

const hpp = `#ifndef BAR_HPP
#define BAR_HPP

int bar();

#endif
`;

fs.writeFileSync(fileName + '.hpp', hpp);

const cpp = `#include <bar.hpp>

int bar() {
  return 2;
}
`;

fs.writeFileSync(fileName + '.cpp', cpp);
