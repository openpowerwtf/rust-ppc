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
rm -rf target;cargo build
   Compiling rt v0.1.0 (/data/projects/rust-ppc/rt)
   Compiling rt-test v0.1.0 (/data/projects/rust-ppc/rt-test)
    Finished dev [unoptimized + debuginfo] target(s) in 0.88s
powerpc-linux-gnu-objdump -D target/powerpc-unknown-linux-gnu/debug/rt-test

target/powerpc-unknown-linux-gnu/debug/rt-test:     file format elf32-powerpc


Disassembly of section .boot:

00000000 <Reset>:
   0:	7c 08 02 a6 	mflr    r0
   4:	90 01 00 04 	stw     r0,4(r1)
   8:	94 21 ff f0 	stwu    r1,-16(r1)
   c:	48 00 03 f5 	bl      400 <main>
  10:	7f e0 00 08 	trap

Disassembly of section .text:

00000400 <main>:
 400:	94 21 ff f0 	stwu    r1,-16(r1)
 404:	3c 60 08 67 	lis     r3,2151
 408:	60 63 53 09 	ori     r3,r3,21257
 40c:	90 61 00 0c 	stw     r3,12(r1)
 410:	48 00 00 04 	b       414 <main+0x14>
 414:	48 00 00 00 	b       414 <main+0x14>

Disassembly of section .got:

00000418 <.got>:
 418:	4e 80 00 21 	blrl

0000041c <_GLOBAL_OFFSET_TABLE_>:
```