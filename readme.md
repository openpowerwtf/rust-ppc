# Rust embedded

* https://github.com/rust-lang/rust/issues/93335

   * no support for Power inline asm yet


```
rustup target add powerpc-unknown-linux-gnu

cd ppc32-test
cargo build
   Compiling ppc32-test v0.1.0 (/data/projects/rust-ppc/ppc32-test)
   Finished dev [unoptimized + debuginfo] target(s) in 0.48s
powerpc-linux-gnu-objdump -s target/powerpc-unknown-linux-gnu/debug/ppc32-test

target/powerpc-unknown-linux-gnu/debug/ppc32-test:     file format elf32-powerpc

Contents of section .text:
 0000 48000004 48000000                    H...H...
Contents of section .got:
 0008 4e800021 00000000 00000000 00000000  N..!............
```

```
cd rt-test
cargo build
   Compiling rt v0.1.0 (/data/projects/rust-ppc/rt)
   Compiling rt-test v0.1.0 (/data/projects/rust-ppc/rt-test)
    Finished dev [unoptimized + debuginfo] target(s) in 0.91s
powerpc-linux-gnu-objdump -D target/powerpc-unknown-linux-gnu/debug/rt-test

target/powerpc-unknown-linux-gnu/debug/rt-test:     file format elf32-powerpc


Disassembly of section .text:

00000000 <main>:
   0:	94 21 ff f0 	stwu    r1,-16(r1)
   4:	3c 60 08 67 	lis     r3,2151
   8:	60 63 53 09 	ori     r3,r3,21257
   c:	90 61 00 0c 	stw     r3,12(r1)
  10:	48 00 00 04 	b       14 <main+0x14>
  14:	48 00 00 00 	b       14 <main+0x14>

00000018 <Reset>:
  18:	7c 08 02 a6 	mflr    r0
  1c:	90 01 00 04 	stw     r0,4(r1)
  20:	94 21 ff f0 	stwu    r1,-16(r1)
  24:	4b ff ff dd 	bl      0 <main>
  28:	7f e0 00 08 	trap

Disassembly of section .got:

0000002c <.got>:
  2c:	4e 80 00 21 	blrl

00000030 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .vector_table.reset_vector:

0000003c <RESET_VECTOR>:
  3c:	00 00 00 00 	.long 0x0

Disassembly of section .rela.dyn:

00000040 <__bss_end-0xc>:
  40:	00 00 00 3c 	.long 0x3c
  44:	00 00 00 16 	.long 0x16
  48:	00 00 00 18 	.long 0x18
```