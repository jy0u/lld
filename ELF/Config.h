//===- Config.h -----------------------------------------------------------===//
//
//                             The LLVM Linker
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef LLD_ELF_CONFIG_H
#define LLD_ELF_CONFIG_H

#include "llvm/ADT/StringRef.h"

namespace lld {
namespace elf2 {

struct Configuration {
  llvm::StringRef OutputFile;
};

extern Configuration *Config;

} // namespace elf2
} // namespace lld

#endif