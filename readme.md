# Rust embedded

* https://github.com/rust-lang/rust/issues/93335

   * no support for Power inline asm yet


```
rustup target add powerpc-unknown-linux-gnu

cd ppc32-test
cargo build
Finished dev [unoptimized + debuginfo] target(s) in 0.00s
rm -rf target;cargo build
Compiling ppc32-test v0.1.0 (/data/projects/rust-ppc/ppc32-test)
Finished dev [unoptimized + debuginfo] target(s) in 0.48s
powerpc-linux-gnu-objdump -s target/powerpc-unknown-linux-gnu/debug/ppc32-test

target/powerpc-unknown-linux-gnu/debug/ppc32-test:     file format elf32-powerpc

Contents of section .text:
 0000 48000004 48000000                    H...H...
Contents of section .got:
 0008 4e800021 00000000 00000000 00000000  N..!............
```