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

powerpc-linux-gnu-objdump -D target/powerpc-unknown-linux-gnu/release/rt-test > rt-test.d

# looks semicopacetic so far
# can't get static config info to be saved though
```

* try to run on a2p litex soc

```
powerpc-linux-gnu-objcopy -O binary target/powerpc-unknown-linux-gnu/release/rt-test rom.bin

# make rom.bin.hex
bin2init rom.bin
mv rom.bin.hex rom.init
# too many extra 0's at end - something with ebss in the obj file??
head -8000 rom.init > tmp
mv tmp rom.init
```

* somethin wrong(s) with linking; 99 GOT problems?
* gets to call to puts() in picolibc but clearly not creating R9 address correctly

```
00000244 <puts>:
 244:	94 21 ff e0 	stwu    r1,-32(r1)
 248:	7c 08 02 a6 	mflr    r0
 24c:	3d 20 00 00 	lis     r9,0
 250:	90 01 00 24 	stw     r0,36(r1)
 254:	39 61 00 20 	addi    r11,r1,32
 258:	4b ff fd f9 	bl      50 <_savegpr_29>
 25c:	83 c9 00 00 	lwz     r30,0(r9)
```

```
$dir/V$mod | tee sim_soc.txt

Tracing enabled.
Initializing UART on port 2593 with config=00000364
Listening on port 2593
litex_term socket://localhost:2593 in a console, then hit enter here....
%Warning: cmod7_sram.init:0: $readmem file not found
%Warning: cmod7_main_ram.init:0: $readmem file not found
%Warning: cmod7_mem.init:0: $readmem file not found
00000034 C0: CP 0:000000 [3C200001]
00000034 C0: GPR Update: R01=00010000
00000035 C0: CP 0:000004 [6021FFF8]
00000035 C0: GPR Update: R01=0001FFF8
00000036 C0: CP 0:000008 [3FC00000]
00000036 C0: GPR Update: R30=00000000
00000037 C0: CP 0:00000C [63DE0324]
00000037 C0: GPR Update: R30=00000324
00000038 C0: CP 0:000010 [48000131]
00000062 C0: CP 0:000140 [7C0802A6]
00000062 C0: GPR Update: R00=00000014
00000063 C0: CP 0:000144 [90010004]
00000064 WB WR ACK RA=0001FFFC SEL=F DATA=00000014
00000065 WB WR ACK RA=0001FFFC SEL=F DATA=00000014
00000066 C0: CP 0:000148 [9421FFF0]
00000066 C0: GPR Update: R01=0001FFE8
00000066 WB WR ACK RA=0001FFFC SEL=F DATA=00000014
00000067 WB WR ACK RA=0001FFE8 SEL=F DATA=0001FFF8
00000068 C0: CP 0:00014C [93C10008]
00000068 WB WR ACK RA=0001FFE8 SEL=F DATA=0001FFF8
00000069 C0: CP 0:000150 [48000005]
00000069 WB WR ACK RA=0001FFF0 SEL=F DATA=00000324
00000070 WB WR ACK RA=0001FFF0 SEL=F DATA=00000324
00000073 C0: CP 0:000154 [7FC802A6]
00000073 C0: GPR Update: R30=00000154
00000076 WB RD ACK RA=00000120 DATA=90A40010
00000078 WB RD ACK RA=00000124 DATA=5463063E
00000080 WB RD ACK RA=00000128 DATA=4E800020
00000082 WB RD ACK RA=0000012C DATA=3C60FFF0
00000084 WB RD ACK RA=00000130 DATA=80634008
00000086 WB RD ACK RA=00000134 DATA=5463063E
00000088 WB RD ACK RA=00000138 DATA=4E800020
00000090 WB RD ACK RA=0000013C DATA=00008EBC
00000094 C0: CP 0:000158 [807EFFE8]
00000094 C0: GPR Update: R03=00008EBC
00000097 C0: CP 0:00015C [7FC3F214]
00000097 C0: GPR Update: R30=00009010
00000122 WB RD ACK RA=00001000 DATA=57544621
00000124 WB RD ACK RA=00001004 DATA=20793D7B
00000126 WB RD ACK RA=00001008 DATA=7D000000
00000128 WB RD ACK RA=0000100C DATA=00000000
00000130 WB RD ACK RA=00001010 DATA=00000000
00000132 WB RD ACK RA=00001014 DATA=00000000
00000134 WB RD ACK RA=00001018 DATA=00000000
00000136 WB RD ACK RA=0000101C DATA=00000000
00000140 C0: CP 0:000160 [807E8000]
00000140 C0: GPR Update: R03=00000000
00000141 C0: CP 0:000164 [809E8004]
00000141 C0: GPR Update: R04=00000000
00000144 C0: CP 0:000168 [7C641851]
00000144 C0: GPR Update: R03=00000000
00000145 C0: CP 0:00016C [41820018]
00000170 C0: CP 0:000184 [807E8008]
00000170 C0: GPR Update: R03=00000000
00000171 C0: CP 0:000188 [809E800C]
00000171 C0: GPR Update: R04=00000000
00000174 C0: CP 0:00018C [7C641851]
00000174 C0: GPR Update: R03=00000000
00000175 C0: CP 0:000190 [41820018]
00000199 C0: CP 0:0001A8 [3C60FFF0]
00000199 C0: GPR Update: R03=FFF00000
00000203 WB RD ACK RA=FFF04004 DATA=00000000
00000204 C0: CP 0:0001AC [80634004]
00000204 C0: GPR Update: R03=00000000
00000207 C0: CP 0:0001B0 [28030000]
00000208 C0: CP 0:0001B4 [40E2FFF4]
00000209 C0: CP 0:0001B8 [4800000D]
00000232 C0: CP 0:0001C4 [7C0802A6]
00000232 C0: GPR Update: R00=000001BC
00000233 C0: CP 0:0001C8 [90010004]
00000234 WB WR ACK RA=0001FFEC SEL=F DATA=000001BC
00000235 WB WR ACK RA=0001FFEC SEL=F DATA=000001BC
00000236 C0: CP 0:0001CC [9421FFF0]
00000236 C0: GPR Update: R01=0001FFD8
00000236 WB WR ACK RA=0001FFEC SEL=F DATA=000001BC
00000237 WB WR ACK RA=0001FFD8 SEL=F DATA=0001FFE8
00000238 C0: CP 0:0001D0 [93C10008]
00000238 WB WR ACK RA=0001FFD8 SEL=F DATA=0001FFE8
00000239 C0: CP 0:0001D4 [48000005]
00000239 WB WR ACK RA=0001FFE0 SEL=F DATA=00009010
00000240 WB WR ACK RA=0001FFE0 SEL=F DATA=00009010
00000243 C0: CP 0:0001D8 [38600000]
00000243 C0: GPR Update: R03=00000000
00000244 C0: CP 0:0001DC [7FC802A6]
00000244 C0: GPR Update: R30=000001D8
00000269 WB RD ACK RA=000001C0 DATA=00008E34
00000271 WB RD ACK RA=000001C4 DATA=7C0802A6
00000273 WB RD ACK RA=000001C8 DATA=90010004
00000275 WB RD ACK RA=000001CC DATA=9421FFF0
00000277 WB RD ACK RA=000001D0 DATA=93C10008
00000279 WB RD ACK RA=000001D4 DATA=48000005
00000281 WB RD ACK RA=000001D8 DATA=38600000
00000283 WB RD ACK RA=000001DC DATA=7FC802A6
00000287 C0: CP 0:0001E0 [809EFFE8]
00000287 C0: GPR Update: R04=00008E34
00000290 C0: CP 0:0001E4 [7FC4F214]
00000290 C0: GPR Update: R30=0000900C
00000291 C0: CP 0:0001E8 [2C030000]
00000292 C0: CP 0:0001EC [3C600867]
00000292 C0: GPR Update: R03=08670000
00000293 C0: CP 0:0001F0 [60635309]
00000293 C0: GPR Update: R03=08675309
00000294 C0: CP 0:0001F4 [807E8000]
00000294 C0: GPR Update: R03=00000000
00000295 C0: CP 0:0001F8 [4800004D]
00000338 C0: CP 0:000244 [9421FFE0]
00000338 C0: GPR Update: R01=0001FFB8
00000339 C0: CP 0:000248 [7C0802A6]
00000339 C0: GPR Update: R00=000001FC
00000339 WB WR ACK RA=0001FFB8 SEL=F DATA=0001FFD8
00000340 C0: CP 0:00024C [3D200000]
00000340 C0: GPR Update: R09=00000000
00000340 WB WR ACK RA=0001FFB8 SEL=F DATA=0001FFD8
00000341 C0: CP 0:000250 [90010024]
00000341 WB WR ACK RA=0001FFB8 SEL=F DATA=0001FFD8
00000342 C0: CP 0:000254 [39610020]
00000342 C0: GPR Update: R11=0001FFD8
00000342 WB WR ACK RA=0001FFDC SEL=F DATA=000001FC
00000343 C0: CP 0:000258 [4BFFFDF9]
00000343 WB WR ACK RA=0001FFDC SEL=F DATA=000001FC
00000387 C0: CP 0:000050 [93ABFFF4]
00000388 WB WR ACK RA=0001FFCC SEL=F DATA=00000000
00000389 WB WR ACK RA=0001FFCC SEL=F DATA=00000000
00000390 C0: CP 0:000054 [93CBFFF8]
00000390 WB WR ACK RA=0001FFCC SEL=F DATA=00000000
00000391 WB WR ACK RA=0001FFD0 SEL=F DATA=0000900C
00000392 C0: CP 0:000058 [93EBFFFC]
00000392 WB WR ACK RA=0001FFD0 SEL=F DATA=0000900C
00000393 C0: CP 0:00005C [4E800020]
00000393 WB WR ACK RA=0001FFD4 SEL=F DATA=00000000
00000394 WB WR ACK RA=0001FFD4 SEL=F DATA=00000000
00000455 WB RD ACK RA=00000000 DATA=3C200001
00000457 WB RD ACK RA=00000004 DATA=6021FFF8
00000459 WB RD ACK RA=00000008 DATA=3FC00000
00000461 WB RD ACK RA=0000000C DATA=63DE0324
00000463 WB RD ACK RA=00000010 DATA=48000131
00000465 WB RD ACK RA=00000014 DATA=48000000
00000467 WB RD ACK RA=00000018 DATA=48000000
00000469 WB RD ACK RA=0000001C DATA=920BFFC0
00000473 C0: CP 0:00025C [83C90000]
00000473 C0: GPR Update: R30=3C200001
```