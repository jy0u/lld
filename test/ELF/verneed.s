# REQUIRES: x86
# RUN: llvm-mc -filetype=obj -triple=x86_64-pc-linux %s -o %t.o
# RUN: ld.lld %t.o %S/Inputs/verneed1.so %S/Inputs/verneed2.so -o %t
# RUN: llvm-readobj -V -sections -section-data -dyn-symbols -dynamic-table %t | FileCheck %s

# CHECK:        Section {
# CHECK:         Index: 1
# CHECK-NEXT:    Name: .dynsym (1)
# CHECK-NEXT:    Type: SHT_DYNSYM (0xB)
# CHECK-NEXT:    Flags [ (0x2)
# CHECK-NEXT:      SHF_ALLOC (0x2)
# CHECK-NEXT:    ]
# CHECK-NEXT:    Address: 0x101C8
# CHECK-NEXT:    Offset: 0x1C8
# CHECK-NEXT:    Size: 96
# CHECK-NEXT:    Link: 5
# CHECK-NEXT:    Info: 1
# CHECK-NEXT:    AddressAlignment: 8
# CHECK-NEXT:    EntrySize: 24
# CHECK:       Section {
# CHECK-NEXT:   Index: 2
# CHECK-NEXT:   Name: .gnu.version (9)
# CHECK-NEXT:   Type: SHT_GNU_versym (0x6FFFFFFF)
# CHECK-NEXT:   Flags [ (0x2)
# CHECK-NEXT:     SHF_ALLOC (0x2)
# CHECK-NEXT:   ]
# CHECK-NEXT:   Address: 0x10228
# CHECK-NEXT:   Offset: 0x228
# CHECK-NEXT:   Size: 8
# CHECK-NEXT:   Link: 1
# CHECK-NEXT:   Info: 0
# CHECK-NEXT:   AddressAlignment: 2
# CHECK-NEXT:   EntrySize: 2
# CHECK:       Section {
# CHECK-NEXT:   Index: 3
# CHECK-NEXT:   Name: .gnu.version_r (22)
# CHECK-NEXT:   Type: SHT_GNU_verneed (0x6FFFFFFE)
# CHECK-NEXT:   Flags [ (0x2)
# CHECK-NEXT:     SHF_ALLOC (0x2)
# CHECK-NEXT:   ]
# CHECK-NEXT:   Address: 0x10230
# CHECK-NEXT:   Offset: 0x230
# CHECK-NEXT:   Size: 80
# CHECK-NEXT:   Link: 5
# CHECK-NEXT:   Info: 2
# CHECK-NEXT:   AddressAlignment: 4
# CHECK-NEXT:   EntrySize: 0
# CHECK:      Section {
# CHECK:        Index: 5
# CHECK-NEXT:   Name: .dynstr
# CHECK-NEXT:   Type: SHT_STRTAB
# CHECK-NEXT:   Flags [ (0x2)
# CHECK-NEXT:     SHF_ALLOC (0x2)
# CHECK-NEXT:   ]
# CHECK-NEXT:   Address: 0x102A8
# CHECK-NEXT:   Offset: 0x2A8
# CHECK-NEXT:   Size: 47
# CHECK-NEXT:   Link: 0
# CHECK-NEXT:   Info: 0
# CHECK-NEXT:   AddressAlignment: 1
# CHECK-NEXT:   EntrySize: 0
# CHECK-NEXT:   SectionData (
# CHECK-NEXT:     0000: 00663100 7665726E 65656431 2E736F2E  |.f1.verneed1.so.|
# CHECK-NEXT:     0010: 30007633 00663200 76320067 31007665  |0.v3.f2.v2.g1.ve|
# CHECK-NEXT:     0020: 726E6565 64322E73 6F2E3000 763100    |rneed2.so.0.v1.|
# CHECK-NEXT:   )
# CHECK-NEXT: }

# CHECK:      DynamicSymbols [
# CHECK-NEXT:   Symbol {
# CHECK-NEXT:     Name: @ (0)
# CHECK-NEXT:     Value: 0x0
# CHECK-NEXT:     Size: 0
# CHECK-NEXT:     Binding: Local (0x0)
# CHECK-NEXT:     Type: None (0x0)
# CHECK-NEXT:     Other: 0
# CHECK-NEXT:     Section: Undefined (0x0)
# CHECK-NEXT:   }
# CHECK-NEXT:   Symbol {
# CHECK-NEXT:     Name: f1@v3 (1)
# CHECK-NEXT:     Value: 0x0
# CHECK-NEXT:     Size: 0
# CHECK-NEXT:     Binding: Global (0x1)
# CHECK-NEXT:     Type: None (0x0)
# CHECK-NEXT:     Other: 0
# CHECK-NEXT:     Section: Undefined (0x0)
# CHECK-NEXT:   }
# CHECK-NEXT:   Symbol {
# CHECK-NEXT:     Name: f2@v2 (21)
# CHECK-NEXT:     Value: 0x0
# CHECK-NEXT:     Size: 0
# CHECK-NEXT:     Binding: Global (0x1)
# CHECK-NEXT:     Type: None (0x0)
# CHECK-NEXT:     Other: 0
# CHECK-NEXT:     Section: Undefined (0x0)
# CHECK-NEXT:   }
# CHECK-NEXT:   Symbol {
# CHECK-NEXT:     Name: g1@v1 (27)
# CHECK-NEXT:     Value: 0x0
# CHECK-NEXT:     Size: 0
# CHECK-NEXT:     Binding: Global (0x1)
# CHECK-NEXT:     Type: None (0x0)
# CHECK-NEXT:     Other: 0
# CHECK-NEXT:     Section: Undefined (0x0)
# CHECK-NEXT:   }
# CHECK-NEXT: ]

# CHECK:      0x000000006FFFFFF0 VERSYM               0x10228
# CHECK-NEXT: 0x000000006FFFFFFE VERNEED              0x10230
# CHECK-NEXT: 0x000000006FFFFFFF VERNEEDNUM           2

# CHECK:      Version symbols {
# CHECK-NEXT:    Section Name: .gnu.version
# CHECK-NEXT:    Address: 0x10228
# CHECK-NEXT:    Offset: 0x228
# CHECK-NEXT:    Link: 1
# CHECK-NEXT:    Symbols [
# CHECK-NEXT:      Symbol {
# CHECK-NEXT:        Version: 0
# CHECK-NEXT:        Name: @
# CHECK-NEXT:      }
# CHECK-NEXT:      Symbol {
# CHECK-NEXT:        Version: 2
# CHECK-NEXT:        Name: f1@v3
# CHECK-NEXT:      }
# CHECK-NEXT:      Symbol {
# CHECK-NEXT:        Version: 3
# CHECK-NEXT:        Name: f2@v2
# CHECK-NEXT:      }
# CHECK-NEXT:      Symbol {
# CHECK-NEXT:        Version: 4
# CHECK-NEXT:        Name: g1@v1
# CHECK-NEXT:      }
# CHECK-NEXT:    ]
# CHECK-NEXT:  }
# CHECK-NEXT:  Version definition {
# CHECK-NEXT:  }
# CHECK-NEXT:  SHT_GNU_verneed {
# CHECK-NEXT:    Dependency {
# CHECK-NEXT:      Version: 1
# CHECK-NEXT:      Count: 2
# CHECK-NEXT:      FileName: verneed1.so.0
# CHECK-NEXT:      Entry {
# CHECK-NEXT:        Hash: 1938
# CHECK-NEXT:        Flags: 0x0
# CHECK-NEXT:        Index: 3
# CHECK-NEXT:        Name: v2
# CHECK-NEXT:      }
# CHECK-NEXT:      Entry {
# CHECK-NEXT:        Hash: 1939
# CHECK-NEXT:        Flags: 0x0
# CHECK-NEXT:        Index: 2
# CHECK-NEXT:        Name: v3
# CHECK-NEXT:      }
# CHECK-NEXT:    }
# CHECK-NEXT:    Dependency {
# CHECK-NEXT:      Version: 1
# CHECK-NEXT:      Count: 1
# CHECK-NEXT:      FileName: verneed2.so.0
# CHECK-NEXT:      Entry {
# CHECK-NEXT:        Hash: 1937
# CHECK-NEXT:        Flags: 0x0
# CHECK-NEXT:        Index: 4
# CHECK-NEXT:        Name: v1
# CHECK-NEXT:      }
# CHECK-NEXT:    }
# CHECK-NEXT:  }

.globl _start
_start:
call f1@plt
call f2@plt
call g1@plt
