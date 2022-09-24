
target/powerpc-unknown-linux-gnu/release/rt-test:     file format elf32-powerpc


Disassembly of section .boot:

00000000 <_start>:
   0:	38 20 00 1f 	li      r1,31
   4:	64 21 ff f8 	oris    r1,r1,65528
   8:	48 00 01 31 	bl      138 <Reset>
   c:	48 00 00 00 	b       c <BIOS_32+0xb>

00000010 <rust_begin_unwind>:
  10:	48 00 00 00 	b       10 <rust_begin_unwind>

Disassembly of section .rt:

00000014 <_savegpr_16>:
  14:	92 0b ff c0 	stw     r16,-64(r11)

00000018 <_savegpr_17>:
  18:	92 2b ff c4 	stw     r17,-60(r11)

0000001c <_savegpr_18>:
  1c:	92 4b ff c8 	stw     r18,-56(r11)

00000020 <_savegpr_19>:
  20:	92 6b ff cc 	stw     r19,-52(r11)

00000024 <_savegpr_20>:
  24:	92 8b ff d0 	stw     r20,-48(r11)

00000028 <_savegpr_21>:
  28:	92 ab ff d4 	stw     r21,-44(r11)

0000002c <_savegpr_22>:
  2c:	92 cb ff d8 	stw     r22,-40(r11)

00000030 <_savegpr_23>:
  30:	92 eb ff dc 	stw     r23,-36(r11)

00000034 <_savegpr_24>:
  34:	93 0b ff e0 	stw     r24,-32(r11)

00000038 <_savegpr_25>:
  38:	93 2b ff e4 	stw     r25,-28(r11)

0000003c <_savegpr_26>:
  3c:	93 4b ff e8 	stw     r26,-24(r11)

00000040 <_savegpr_27>:
  40:	93 6b ff ec 	stw     r27,-20(r11)

00000044 <_savegpr_28>:
  44:	93 8b ff f0 	stw     r28,-16(r11)

00000048 <_savegpr_29>:
  48:	93 ab ff f4 	stw     r29,-12(r11)

0000004c <_savegpr_30>:
  4c:	93 cb ff f8 	stw     r30,-8(r11)

00000050 <_savegpr_31>:
  50:	93 eb ff fc 	stw     r31,-4(r11)
  54:	4e 80 00 20 	blr

00000058 <_rest32gpr_16_x>:
  58:	82 0b ff c0 	lwz     r16,-64(r11)

0000005c <_rest32gpr_17_x>:
  5c:	82 2b ff c4 	lwz     r17,-60(r11)

00000060 <_rest32gpr_18_x>:
  60:	82 4b ff c8 	lwz     r18,-56(r11)

00000064 <_rest32gpr_19_x>:
  64:	82 6b ff cc 	lwz     r19,-52(r11)

00000068 <_rest32gpr_20_x>:
  68:	82 8b ff d0 	lwz     r20,-48(r11)

0000006c <_rest32gpr_21_x>:
  6c:	82 ab ff d4 	lwz     r21,-44(r11)

00000070 <_rest32gpr_22_x>:
  70:	82 cb ff d8 	lwz     r22,-40(r11)

00000074 <_rest32gpr_23_x>:
  74:	82 eb ff dc 	lwz     r23,-36(r11)

00000078 <_rest32gpr_24_x>:
  78:	83 0b ff e0 	lwz     r24,-32(r11)

0000007c <_rest32gpr_25_x>:
  7c:	83 2b ff e4 	lwz     r25,-28(r11)

00000080 <_rest32gpr_26_x>:
  80:	83 4b ff e8 	lwz     r26,-24(r11)

00000084 <_rest32gpr_27_x>:
  84:	83 6b ff ec 	lwz     r27,-20(r11)

00000088 <_rest32gpr_28_x>:
  88:	83 8b ff f0 	lwz     r28,-16(r11)

0000008c <_rest32gpr_29_x>:
  8c:	83 ab ff f4 	lwz     r29,-12(r11)

00000090 <_rest32gpr_30_x>:
  90:	83 cb ff f8 	lwz     r30,-8(r11)

00000094 <_rest32gpr_31_x>:
  94:	80 0b 00 04 	lwz     r0,4(r11)
  98:	83 eb ff fc 	lwz     r31,-4(r11)
  9c:	7c 08 03 a6 	mtlr    r0
  a0:	7d 61 5b 78 	mr      r1,r11
  a4:	4e 80 00 20 	blr

000000a8 <uart_init>:
  a8:	3c 60 ff f0 	lis     r3,-16
  ac:	3c 80 ff f0 	lis     r4,-16
  b0:	80 63 40 10 	lwz     r3,16400(r3)
  b4:	60 83 40 10 	ori     r3,r4,16400
  b8:	38 80 00 03 	li      r4,3
  bc:	90 83 00 04 	stw     r4,4(r3)
  c0:	4e 80 00 20 	blr

000000c4 <uart_sync>:
  c4:	3c 60 ff f0 	lis     r3,-16
  c8:	80 83 40 04 	lwz     r4,16388(r3)
  cc:	28 04 00 00 	cmplwi  r4,0
  d0:	40 82 ff f8 	bne     c8 <uart_sync+0x4>
  d4:	4e 80 00 20 	blr

000000d8 <uart_write>:
  d8:	3c 80 ff f0 	lis     r4,-16
  dc:	60 84 40 00 	ori     r4,r4,16384
  e0:	80 a4 00 04 	lwz     r5,4(r4)
  e4:	28 05 00 00 	cmplwi  r5,0
  e8:	40 82 ff f8 	bne     e0 <uart_write+0x8>
  ec:	90 64 00 00 	stw     r3,0(r4)
  f0:	38 60 00 01 	li      r3,1
  f4:	90 64 00 10 	stw     r3,16(r4)
  f8:	4e 80 00 20 	blr

000000fc <uart_read>:
  fc:	3c 60 ff f0 	lis     r3,-16
 100:	60 64 40 00 	ori     r4,r3,16384
 104:	80 64 00 08 	lwz     r3,8(r4)
 108:	28 03 00 00 	cmplwi  r3,0
 10c:	40 82 ff f8 	bne     104 <uart_read+0x8>
 110:	80 64 00 00 	lwz     r3,0(r4)
 114:	38 a0 00 02 	li      r5,2
 118:	90 a4 00 10 	stw     r5,16(r4)
 11c:	54 63 06 3e 	clrlwi  r3,r3,24
 120:	4e 80 00 20 	blr

00000124 <uart_read_nonblock>:
 124:	3c 60 ff f0 	lis     r3,-16
 128:	80 63 40 08 	lwz     r3,16392(r3)
 12c:	54 63 06 3e 	clrlwi  r3,r3,24
 130:	4e 80 00 20 	blr
 134:	00 00 8e c4 	.long 0x8ec4

00000138 <Reset>:
 138:	7c 08 02 a6 	mflr    r0
 13c:	90 01 00 04 	stw     r0,4(r1)
 140:	94 21 ff f0 	stwu    r1,-16(r1)
 144:	93 c1 00 08 	stw     r30,8(r1)
 148:	48 00 00 05 	bl      14c <Reset+0x14>
 14c:	7f c8 02 a6 	mflr    r30
 150:	80 7e ff e8 	lwz     r3,-24(r30)
 154:	7f c3 f2 14 	add     r30,r3,r30
 158:	80 9e 80 00 	lwz     r4,-32768(r30)
 15c:	80 7e 80 04 	lwz     r3,-32764(r30)
 160:	7c a3 20 50 	subf    r5,r3,r4
 164:	38 80 00 00 	li      r4,0
 168:	48 00 00 9d 	bl      204 <memset>
 16c:	80 9e 80 08 	lwz     r4,-32760(r30)
 170:	80 7e 80 0c 	lwz     r3,-32756(r30)
 174:	7c a3 20 50 	subf    r5,r3,r4
 178:	80 9e 80 10 	lwz     r4,-32752(r30)
 17c:	48 00 00 65 	bl      1e0 <memcpy>
 180:	3c 60 ff f0 	lis     r3,-16
 184:	80 83 40 04 	lwz     r4,16388(r3)
 188:	28 04 00 00 	cmplwi  r4,0
 18c:	40 e2 ff f8 	bne+    184 <Reset+0x4c>
 190:	48 00 00 15 	bl      1a4 <main>
 194:	7f e0 00 08 	trap

Disassembly of section .kernel:

00000198 <main-0xc>:
 198:	60 00 00 00 	nop
 19c:	60 00 00 00 	nop
 1a0:	00 00 8e 54 	.long 0x8e54

000001a4 <main>:
 1a4:	7c 08 02 a6 	mflr    r0
 1a8:	90 01 00 04 	stw     r0,4(r1)
 1ac:	94 21 ff f0 	stwu    r1,-16(r1)
 1b0:	93 c1 00 08 	stw     r30,8(r1)
 1b4:	48 00 00 05 	bl      1b8 <main+0x14>
 1b8:	38 60 00 00 	li      r3,0
 1bc:	7f c8 02 a6 	mflr    r30
 1c0:	80 9e ff e8 	lwz     r4,-24(r30)
 1c4:	7f c4 f2 14 	add     r30,r4,r30
 1c8:	2c 03 00 00 	cmpwi   r3,0
 1cc:	3c 60 08 67 	lis     r3,2151
 1d0:	60 63 53 09 	ori     r3,r3,21257
 1d4:	80 7e 80 00 	lwz     r3,-32768(r30)
 1d8:	48 00 00 4d 	bl      224 <puts>
 1dc:	48 00 00 00 	b       1dc <main+0x38>

000001e0 <memcpy>:
 1e0:	39 45 00 01 	addi    r10,r5,1
 1e4:	39 20 00 00 	li      r9,0
 1e8:	7d 49 03 a6 	mtctr   r10
 1ec:	42 00 00 08 	bdnz    1f4 <memcpy+0x14>
 1f0:	4e 80 00 20 	blr
 1f4:	7d 44 48 ae 	lbzx    r10,r4,r9
 1f8:	7d 43 49 ae 	stbx    r10,r3,r9
 1fc:	39 29 00 01 	addi    r9,r9,1
 200:	4b ff ff ec 	b       1ec <memcpy+0xc>

00000204 <memset>:
 204:	39 45 00 01 	addi    r10,r5,1
 208:	39 20 00 00 	li      r9,0
 20c:	7d 49 03 a6 	mtctr   r10
 210:	42 00 00 08 	bdnz    218 <memset+0x14>
 214:	4e 80 00 20 	blr
 218:	7c 83 49 ae 	stbx    r4,r3,r9
 21c:	39 29 00 01 	addi    r9,r9,1
 220:	4b ff ff f0 	b       210 <memset+0xc>

00000224 <puts>:
 224:	94 21 ff e0 	stwu    r1,-32(r1)
 228:	7c 08 02 a6 	mflr    r0
 22c:	3d 20 00 00 	lis     r9,0
 230:	90 01 00 24 	stw     r0,36(r1)
 234:	39 61 00 20 	addi    r11,r1,32
 238:	4b ff fe 11 	bl      48 <_savegpr_29>
 23c:	83 c9 00 00 	lwz     r30,0(r9)
 240:	89 3e 00 02 	lbz     r9,2(r30)
 244:	71 29 00 02 	andi.   r9,r9,2
 248:	41 82 00 34 	beq     27c <puts+0x58>
 24c:	3b e3 ff ff 	addi    r31,r3,-1
 250:	3b a0 00 00 	li      r29,0
 254:	8c 7f 00 01 	lbzu    r3,1(r31)
 258:	81 3e 00 04 	lwz     r9,4(r30)
 25c:	7f c4 f3 78 	mr      r4,r30
 260:	2c 03 00 00 	cmpwi   r3,0
 264:	7d 29 03 a6 	mtctr   r9
 268:	40 82 00 24 	bne     28c <puts+0x68>
 26c:	38 60 00 0a 	li      r3,10
 270:	4e 80 04 21 	bctrl
 274:	2c 03 00 00 	cmpwi   r3,0
 278:	41 82 00 08 	beq     280 <puts+0x5c>
 27c:	3b a0 ff ff 	li      r29,-1
 280:	39 61 00 20 	addi    r11,r1,32
 284:	7f a3 eb 78 	mr      r3,r29
 288:	4b ff fe 04 	b       8c <_rest32gpr_29_x>
 28c:	4e 80 04 21 	bctrl
 290:	2c 03 00 00 	cmpwi   r3,0
 294:	41 82 ff c0 	beq     254 <puts+0x30>
 298:	3b a0 ff ff 	li      r29,-1
 29c:	4b ff ff b8 	b       254 <puts+0x30>

000002a0 <litex_getc>:
 2a0:	94 21 ff f0 	stwu    r1,-16(r1)
 2a4:	7c 08 02 a6 	mflr    r0
 2a8:	90 01 00 14 	stw     r0,20(r1)
 2ac:	4b ff fe 79 	bl      124 <uart_read_nonblock>
 2b0:	2c 03 00 00 	cmpwi   r3,0
 2b4:	41 82 ff f8 	beq     2ac <litex_getc+0xc>
 2b8:	4b ff fe 45 	bl      fc <uart_read>
 2bc:	80 01 00 14 	lwz     r0,20(r1)
 2c0:	38 21 00 10 	addi    r1,r1,16
 2c4:	7c 08 03 a6 	mtlr    r0
 2c8:	4e 80 00 20 	blr

000002cc <litex_putc>:
 2cc:	94 21 ff f0 	stwu    r1,-16(r1)
 2d0:	7c 08 02 a6 	mflr    r0
 2d4:	93 e1 00 0c 	stw     r31,12(r1)
 2d8:	7c 7f 1b 78 	mr      r31,r3
 2dc:	90 01 00 14 	stw     r0,20(r1)
 2e0:	4b ff fd f9 	bl      d8 <uart_write>
 2e4:	28 1f 00 0a 	cmplwi  r31,10
 2e8:	40 82 00 10 	bne     2f8 <litex_putc+0x2c>
 2ec:	38 80 00 00 	li      r4,0
 2f0:	38 60 00 0d 	li      r3,13
 2f4:	4b ff ff d9 	bl      2cc <litex_putc>
 2f8:	39 61 00 10 	addi    r11,r1,16
 2fc:	7f e3 fb 78 	mr      r3,r31
 300:	4b ff fd 94 	b       94 <_rest32gpr_31_x>

Disassembly of section .rodata:

00000304 <.rodata>:
	...
    1000:	57 54 46 21 	rlwinm. r20,r26,8,24,16
    1004:	20 79 3d 7b 	subfic  r3,r25,15739
    1008:	7d 00 00 00 	cmpw    cr2,r0,r0
	...

Disassembly of section .data:

000010c4 <__stdio-0x4>:
    10c4:	00 00 00 00 	.long 0x0

000010c8 <__stdio>:
    10c8:	00 00 03 00 	.long 0x300
	...

000010d8 <stdin>:
    10d8:	00 00 00 00 	.long 0x0

000010dc <stderr>:
    10dc:	00 00 00 00 	.long 0x0

000010e0 <stdout>:
    10e0:	00 00 00 00 	.long 0x0

000010e4 <_edata>:
    10e4:	00 00 00 00 	.long 0x0

Disassembly of section .got:

000010e8 <.got>:
    10e8:	4e 80 00 21 	blrl

000010ec <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .bss:

00100034 <_ebss-0x4>:
  100034:	00 00 00 00 	.long 0x0
