# Rust embedded


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

* add runtime lib
* add picolib linking
* add uart funcs for printing

```
cd rt-test

rm -rf target;cargo build --release

llvm-strip --no-strip-all --remove-section=.rela.dyn target/powerpc-unknown-linux-gnu/release/rt-test

powerpc-linux-gnu-objdump -D target/powerpc-unknown-linux-gnu/release/rt-test

# looks semicopacetic so far
```