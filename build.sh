#! /bin/bash
export PREFIX="$HOME/opt/cross/bin"
export TARGET=i686-elf
export cc="$PREFIX/$TARGET"

mkdir working
mkdir out
rm -rf working/*
rm -rf out/*
rm -rf src/iso/boot/kernel.bin

#compile asm
for f in src/*.asm
do
  file=${f##*/}
  nasm -f aout -o working/$(echo $file | cut -f 1 -d '.').o $f
done
#compile C
cargs="-Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -c -Wno-unused-value -Wno-int-conversion -Wno-incompatible-pointer-types -Wno-implicit-function-declaration -Wno-pointer-sign -I./src/include"
for f in src/*/*.c
do
  file=${f##*/}
  $cc-gcc $cargs -o working/$(echo $file | cut -f 1 -d '.').o $f
done
for f in src/*.c
do
  file=${f##*/}
  $cc-gcc $cargs -o working/$(echo $file | cut -f 1 -d '.').o $f
done
#link
shopt -s nullglob
files=(working/*.o)
$cc-ld -T src/link.ld -o out/kernel.bin $files

#build iso
cp out/kernel.bin src/iso/boot/kernel.bin
grub-mkrescue /usr/lib/grub/i386-pc -o out/ZOS-A6.iso src/iso
