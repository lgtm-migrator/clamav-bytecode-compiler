// RUN: %clang_cc1 -triple x86_64-apple-darwin9 -emit-llvm -fblocks -o %t %s
// RUN: grep 'object_assign' %t | count 11
// RUN: grep 'object_dispose' %t | count 29

int main() {
  typedef id aid __attribute__((aligned(1)));
  __block aid a1;
  __block id a2 __attribute__((aligned(2)));
  __block id a3 __attribute__((aligned(4)));
  __block id a4 __attribute__((aligned(8)));
  __block id a5, a6, a7;
  __block void (^b)();
  ^{ a1=a2=a3=a4=a5=a6=a7=0; b = 0; }();
  return 0;
}