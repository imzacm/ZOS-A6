#! /bin/bash
export PREFIX="$HOME/opt/cross/bin"
export TARGET=i686-elf
export cc="$PREFIX/$TARGET"
#compile asm
for f in src/*.asm
do
  nasm -f aout -o working/$(echo $f | cut -f 1 -d '.').o $f
done
#compile C
cargs="-Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -c"
for f in src/drivers/*.c
do
  $cc-gcc $cargs -o working/$(echo $f | cut -f 1 -d '.').o $f
done
for f in src/*.c
do
  $cc-gcc $cargs -o working/$(echo $f | cut -f 1 -d '.').o $f
done
#link
shopt -s nullglob
files=(working/*.o)
$cc-ld -T src/link.ld -o $files

#build iso
