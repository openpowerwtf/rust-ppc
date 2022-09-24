
target/powerpc-unknown-linux-gnu/release/rt-test:     file format elf32-powerpc


Disassembly of section .boot:

00000000 <_start>:
   0:	3c 20 00 01 	lis     r1,1
   4:	60 21 ff f8 	ori     r1,r1,65528
   8:	3f c0 00 00 	lis     r30,0
   c:	63 de 03 24 	ori     r30,r30,804
  10:	48 00 01 31 	bl      140 <Reset>
  14:	48 00 00 00 	b       14 <BIOS_32+0x13>

00000018 <rust_begin_unwind>:
  18:	48 00 00 00 	b       18 <rust_begin_unwind>

Disassembly of section .rt:

0000001c <_savegpr_16>:
  1c:	92 0b ff c0 	stw     r16,-64(r11)

00000020 <_savegpr_17>:
  20:	92 2b ff c4 	stw     r17,-60(r11)

00000024 <_savegpr_18>:
  24:	92 4b ff c8 	stw     r18,-56(r11)

00000028 <_savegpr_19>:
  28:	92 6b ff cc 	stw     r19,-52(r11)

0000002c <_savegpr_20>:
  2c:	92 8b ff d0 	stw     r20,-48(r11)

00000030 <_savegpr_21>:
  30:	92 ab ff d4 	stw     r21,-44(r11)

00000034 <_savegpr_22>:
  34:	92 cb ff d8 	stw     r22,-40(r11)

00000038 <_savegpr_23>:
  38:	92 eb ff dc 	stw     r23,-36(r11)

0000003c <_savegpr_24>:
  3c:	93 0b ff e0 	stw     r24,-32(r11)

00000040 <_savegpr_25>:
  40:	93 2b ff e4 	stw     r25,-28(r11)

00000044 <_savegpr_26>:
  44:	93 4b ff e8 	stw     r26,-24(r11)

00000048 <_savegpr_27>:
  48:	93 6b ff ec 	stw     r27,-20(r11)

0000004c <_savegpr_28>:
  4c:	93 8b ff f0 	stw     r28,-16(r11)

00000050 <_savegpr_29>:
  50:	93 ab ff f4 	stw     r29,-12(r11)

00000054 <_savegpr_30>:
  54:	93 cb ff f8 	stw     r30,-8(r11)

00000058 <_savegpr_31>:
  58:	93 eb ff fc 	stw     r31,-4(r11)
  5c:	4e 80 00 20 	blr

00000060 <_rest32gpr_16_x>:
  60:	82 0b ff c0 	lwz     r16,-64(r11)

00000064 <_rest32gpr_17_x>:
  64:	82 2b ff c4 	lwz     r17,-60(r11)

00000068 <_rest32gpr_18_x>:
  68:	82 4b ff c8 	lwz     r18,-56(r11)

0000006c <_rest32gpr_19_x>:
  6c:	82 6b ff cc 	lwz     r19,-52(r11)

00000070 <_rest32gpr_20_x>:
  70:	82 8b ff d0 	lwz     r20,-48(r11)

00000074 <_rest32gpr_21_x>:
  74:	82 ab ff d4 	lwz     r21,-44(r11)

00000078 <_rest32gpr_22_x>:
  78:	82 cb ff d8 	lwz     r22,-40(r11)

0000007c <_rest32gpr_23_x>:
  7c:	82 eb ff dc 	lwz     r23,-36(r11)

00000080 <_rest32gpr_24_x>:
  80:	83 0b ff e0 	lwz     r24,-32(r11)

00000084 <_rest32gpr_25_x>:
  84:	83 2b ff e4 	lwz     r25,-28(r11)

00000088 <_rest32gpr_26_x>:
  88:	83 4b ff e8 	lwz     r26,-24(r11)

0000008c <_rest32gpr_27_x>:
  8c:	83 6b ff ec 	lwz     r27,-20(r11)

00000090 <_rest32gpr_28_x>:
  90:	83 8b ff f0 	lwz     r28,-16(r11)

00000094 <_rest32gpr_29_x>:
  94:	83 ab ff f4 	lwz     r29,-12(r11)

00000098 <_rest32gpr_30_x>:
  98:	83 cb ff f8 	lwz     r30,-8(r11)

0000009c <_rest32gpr_31_x>:
  9c:	80 0b 00 04 	lwz     r0,4(r11)
  a0:	83 eb ff fc 	lwz     r31,-4(r11)
  a4:	7c 08 03 a6 	mtlr    r0
  a8:	7d 61 5b 78 	mr      r1,r11
  ac:	4e 80 00 20 	blr

000000b0 <uart_init>:
  b0:	3c 60 ff f0 	lis     r3,-16
  b4:	3c 80 ff f0 	lis     r4,-16
  b8:	80 63 40 10 	lwz     r3,16400(r3)
  bc:	60 83 40 10 	ori     r3,r4,16400
  c0:	38 80 00 03 	li      r4,3
  c4:	90 83 00 04 	stw     r4,4(r3)
  c8:	4e 80 00 20 	blr

000000cc <uart_sync>:
  cc:	3c 60 ff f0 	lis     r3,-16
  d0:	80 83 40 04 	lwz     r4,16388(r3)
  d4:	28 04 00 00 	cmplwi  r4,0
  d8:	40 82 ff f8 	bne     d0 <uart_sync+0x4>
  dc:	4e 80 00 20 	blr

000000e0 <uart_write>:
  e0:	3c 80 ff f0 	lis     r4,-16
  e4:	60 84 40 00 	ori     r4,r4,16384
  e8:	80 a4 00 04 	lwz     r5,4(r4)
  ec:	28 05 00 00 	cmplwi  r5,0
  f0:	40 82 ff f8 	bne     e8 <uart_write+0x8>
  f4:	90 64 00 00 	stw     r3,0(r4)
  f8:	38 60 00 01 	li      r3,1
  fc:	90 64 00 10 	stw     r3,16(r4)
 100:	4e 80 00 20 	blr

00000104 <uart_read>:
 104:	3c 60 ff f0 	lis     r3,-16
 108:	60 64 40 00 	ori     r4,r3,16384
 10c:	80 64 00 08 	lwz     r3,8(r4)
 110:	28 03 00 00 	cmplwi  r3,0
 114:	40 82 ff f8 	bne     10c <uart_read+0x8>
 118:	80 64 00 00 	lwz     r3,0(r4)
 11c:	38 a0 00 02 	li      r5,2
 120:	90 a4 00 10 	stw     r5,16(r4)
 124:	54 63 06 3e 	clrlwi  r3,r3,24
 128:	4e 80 00 20 	blr

0000012c <uart_read_nonblock>:
 12c:	3c 60 ff f0 	lis     r3,-16
 130:	80 63 40 08 	lwz     r3,16392(r3)
 134:	54 63 06 3e 	clrlwi  r3,r3,24
 138:	4e 80 00 20 	blr
 13c:	00 00 8e cc 	.long 0x8ecc

00000140 <Reset>:
 140:	7c 08 02 a6 	mflr    r0
 144:	90 01 00 04 	stw     r0,4(r1)
 148:	94 21 ff f0 	stwu    r1,-16(r1)
 14c:	93 c1 00 08 	stw     r30,8(r1)
 150:	48 00 00 05 	bl      154 <Reset+0x14>
 154:	7f c8 02 a6 	mflr    r30
 158:	80 7e ff e8 	lwz     r3,-24(r30)
 15c:	7f c3 f2 14 	add     r30,r3,r30
 160:	80 7e 80 00 	lwz     r3,-32768(r30)
 164:	80 9e 80 04 	lwz     r4,-32764(r30)
 168:	7c 64 18 51 	subf.   r3,r4,r3
 16c:	41 82 00 18 	beq     184 <Reset+0x44>
 170:	80 9e 80 00 	lwz     r4,-32768(r30)
 174:	80 7e 80 04 	lwz     r3,-32764(r30)
 178:	7c a3 20 50 	subf    r5,r3,r4
 17c:	38 80 00 00 	li      r4,0
 180:	48 00 00 a5 	bl      224 <memset>
 184:	80 7e 80 08 	lwz     r3,-32760(r30)
 188:	80 9e 80 0c 	lwz     r4,-32756(r30)
 18c:	7c 64 18 51 	subf.   r3,r4,r3
 190:	41 82 00 18 	beq     1a8 <Reset+0x68>
 194:	80 9e 80 08 	lwz     r4,-32760(r30)
 198:	80 7e 80 0c 	lwz     r3,-32756(r30)
 19c:	7c a3 20 50 	subf    r5,r3,r4
 1a0:	80 9e 80 10 	lwz     r4,-32752(r30)
 1a4:	48 00 00 5d 	bl      200 <memcpy>
 1a8:	3c 60 ff f0 	lis     r3,-16
 1ac:	80 63 40 04 	lwz     r3,16388(r3)
 1b0:	28 03 00 00 	cmplwi  r3,0
 1b4:	40 e2 ff f4 	bne+    1a8 <Reset+0x68>
 1b8:	48 00 00 0d 	bl      1c4 <main>
 1bc:	7f e0 00 08 	trap

Disassembly of section .kernel:

000001c0 <main-0x4>:
 1c0:	00 00 8e 44 	.long 0x8e44

000001c4 <main>:
 1c4:	7c 08 02 a6 	mflr    r0
 1c8:	90 01 00 04 	stw     r0,4(r1)
 1cc:	94 21 ff f0 	stwu    r1,-16(r1)
 1d0:	93 c1 00 08 	stw     r30,8(r1)
 1d4:	48 00 00 05 	bl      1d8 <main+0x14>
 1d8:	38 60 00 00 	li      r3,0
 1dc:	7f c8 02 a6 	mflr    r30
 1e0:	80 9e ff e8 	lwz     r4,-24(r30)
 1e4:	7f c4 f2 14 	add     r30,r4,r30
 1e8:	2c 03 00 00 	cmpwi   r3,0
 1ec:	3c 60 08 67 	lis     r3,2151
 1f0:	60 63 53 09 	ori     r3,r3,21257
 1f4:	80 7e 80 00 	lwz     r3,-32768(r30)
 1f8:	48 00 00 4d 	bl      244 <puts>
 1fc:	48 00 00 00 	b       1fc <main+0x38>

00000200 <memcpy>:
 200:	39 45 00 01 	addi    r10,r5,1
 204:	39 20 00 00 	li      r9,0
 208:	7d 49 03 a6 	mtctr   r10
 20c:	42 00 00 08 	bdnz    214 <memcpy+0x14>
 210:	4e 80 00 20 	blr
 214:	7d 44 48 ae 	lbzx    r10,r4,r9
 218:	7d 43 49 ae 	stbx    r10,r3,r9
 21c:	39 29 00 01 	addi    r9,r9,1
 220:	4b ff ff ec 	b       20c <memcpy+0xc>

00000224 <memset>:
 224:	39 45 00 01 	addi    r10,r5,1
 228:	39 20 00 00 	li      r9,0
 22c:	7d 49 03 a6 	mtctr   r10
 230:	42 00 00 08 	bdnz    238 <memset+0x14>
 234:	4e 80 00 20 	blr
 238:	7c 83 49 ae 	stbx    r4,r3,r9
 23c:	39 29 00 01 	addi    r9,r9,1
 240:	4b ff ff f0 	b       230 <memset+0xc>

00000244 <puts>:
 244:	94 21 ff e0 	stwu    r1,-32(r1)
 248:	7c 08 02 a6 	mflr    r0
 24c:	3d 20 00 00 	lis     r9,0
 250:	90 01 00 24 	stw     r0,36(r1)
 254:	39 61 00 20 	addi    r11,r1,32
 258:	4b ff fd f9 	bl      50 <_savegpr_29>
 25c:	83 c9 00 00 	lwz     r30,0(r9)
 260:	89 3e 00 02 	lbz     r9,2(r30)
 264:	71 29 00 02 	andi.   r9,r9,2
 268:	41 82 00 34 	beq     29c <puts+0x58>
 26c:	3b e3 ff ff 	addi    r31,r3,-1
 270:	3b a0 00 00 	li      r29,0
 274:	8c 7f 00 01 	lbzu    r3,1(r31)
 278:	81 3e 00 04 	lwz     r9,4(r30)
 27c:	7f c4 f3 78 	mr      r4,r30
 280:	2c 03 00 00 	cmpwi   r3,0
 284:	7d 29 03 a6 	mtctr   r9
 288:	40 82 00 24 	bne     2ac <puts+0x68>
 28c:	38 60 00 0a 	li      r3,10
 290:	4e 80 04 21 	bctrl
 294:	2c 03 00 00 	cmpwi   r3,0
 298:	41 82 00 08 	beq     2a0 <puts+0x5c>
 29c:	3b a0 ff ff 	li      r29,-1
 2a0:	39 61 00 20 	addi    r11,r1,32
 2a4:	7f a3 eb 78 	mr      r3,r29
 2a8:	4b ff fd ec 	b       94 <_rest32gpr_29_x>
 2ac:	4e 80 04 21 	bctrl
 2b0:	2c 03 00 00 	cmpwi   r3,0
 2b4:	41 82 ff c0 	beq     274 <puts+0x30>
 2b8:	3b a0 ff ff 	li      r29,-1
 2bc:	4b ff ff b8 	b       274 <puts+0x30>

000002c0 <litex_getc>:
 2c0:	94 21 ff f0 	stwu    r1,-16(r1)
 2c4:	7c 08 02 a6 	mflr    r0
 2c8:	90 01 00 14 	stw     r0,20(r1)
 2cc:	4b ff fe 61 	bl      12c <uart_read_nonblock>
 2d0:	2c 03 00 00 	cmpwi   r3,0
 2d4:	41 82 ff f8 	beq     2cc <litex_getc+0xc>
 2d8:	4b ff fe 2d 	bl      104 <uart_read>
 2dc:	80 01 00 14 	lwz     r0,20(r1)
 2e0:	38 21 00 10 	addi    r1,r1,16
 2e4:	7c 08 03 a6 	mtlr    r0
 2e8:	4e 80 00 20 	blr

000002ec <litex_putc>:
 2ec:	94 21 ff f0 	stwu    r1,-16(r1)
 2f0:	7c 08 02 a6 	mflr    r0
 2f4:	93 e1 00 0c 	stw     r31,12(r1)
 2f8:	7c 7f 1b 78 	mr      r31,r3
 2fc:	90 01 00 14 	stw     r0,20(r1)
 300:	4b ff fd e1 	bl      e0 <uart_write>
 304:	28 1f 00 0a 	cmplwi  r31,10
 308:	40 82 00 10 	bne     318 <litex_putc+0x2c>
 30c:	38 80 00 00 	li      r4,0
 310:	38 60 00 0d 	li      r3,13
 314:	4b ff ff d9 	bl      2ec <litex_putc>
 318:	39 61 00 10 	addi    r11,r1,16
 31c:	7f e3 fb 78 	mr      r3,r31
 320:	4b ff fd 7c 	b       9c <_rest32gpr_31_x>

Disassembly of section .rodata:

00000324 <_GLOBAL_OFFSET_TABLE_-0xcec>:
     324:	60 00 00 00 	nop
     328:	60 00 00 00 	nop
     32c:	60 00 00 00 	nop
     330:	60 00 00 00 	nop
     334:	60 00 00 00 	nop
     338:	60 00 00 00 	nop
     33c:	60 00 00 00 	nop
     340:	60 00 00 00 	nop
     344:	60 00 00 00 	nop
     348:	60 00 00 00 	nop
     34c:	60 00 00 00 	nop
     350:	60 00 00 00 	nop
     354:	60 00 00 00 	nop
     358:	60 00 00 00 	nop
     35c:	60 00 00 00 	nop
     360:	60 00 00 00 	nop
     364:	60 00 00 00 	nop
     368:	60 00 00 00 	nop
     36c:	60 00 00 00 	nop
     370:	60 00 00 00 	nop
     374:	60 00 00 00 	nop
     378:	60 00 00 00 	nop
     37c:	60 00 00 00 	nop
     380:	60 00 00 00 	nop
     384:	60 00 00 00 	nop
     388:	60 00 00 00 	nop
     38c:	60 00 00 00 	nop
     390:	60 00 00 00 	nop
     394:	60 00 00 00 	nop
     398:	60 00 00 00 	nop
     39c:	60 00 00 00 	nop
     3a0:	60 00 00 00 	nop
     3a4:	60 00 00 00 	nop
     3a8:	60 00 00 00 	nop
     3ac:	60 00 00 00 	nop
     3b0:	60 00 00 00 	nop
     3b4:	60 00 00 00 	nop
     3b8:	60 00 00 00 	nop
     3bc:	60 00 00 00 	nop
     3c0:	60 00 00 00 	nop
     3c4:	60 00 00 00 	nop
     3c8:	60 00 00 00 	nop
     3cc:	60 00 00 00 	nop
     3d0:	60 00 00 00 	nop
     3d4:	60 00 00 00 	nop
     3d8:	60 00 00 00 	nop
     3dc:	60 00 00 00 	nop
     3e0:	60 00 00 00 	nop
     3e4:	60 00 00 00 	nop
     3e8:	60 00 00 00 	nop
     3ec:	60 00 00 00 	nop
     3f0:	60 00 00 00 	nop
     3f4:	60 00 00 00 	nop
     3f8:	60 00 00 00 	nop
     3fc:	60 00 00 00 	nop
     400:	60 00 00 00 	nop
     404:	60 00 00 00 	nop
     408:	60 00 00 00 	nop
     40c:	60 00 00 00 	nop
     410:	60 00 00 00 	nop
     414:	60 00 00 00 	nop
     418:	60 00 00 00 	nop
     41c:	60 00 00 00 	nop
     420:	60 00 00 00 	nop
     424:	60 00 00 00 	nop
     428:	60 00 00 00 	nop
     42c:	60 00 00 00 	nop
     430:	60 00 00 00 	nop
     434:	60 00 00 00 	nop
     438:	60 00 00 00 	nop
     43c:	60 00 00 00 	nop
     440:	60 00 00 00 	nop
     444:	60 00 00 00 	nop
     448:	60 00 00 00 	nop
     44c:	60 00 00 00 	nop
     450:	60 00 00 00 	nop
     454:	60 00 00 00 	nop
     458:	60 00 00 00 	nop
     45c:	60 00 00 00 	nop
     460:	60 00 00 00 	nop
     464:	60 00 00 00 	nop
     468:	60 00 00 00 	nop
     46c:	60 00 00 00 	nop
     470:	60 00 00 00 	nop
     474:	60 00 00 00 	nop
     478:	60 00 00 00 	nop
     47c:	60 00 00 00 	nop
     480:	60 00 00 00 	nop
     484:	60 00 00 00 	nop
     488:	60 00 00 00 	nop
     48c:	60 00 00 00 	nop
     490:	60 00 00 00 	nop
     494:	60 00 00 00 	nop
     498:	60 00 00 00 	nop
     49c:	60 00 00 00 	nop
     4a0:	60 00 00 00 	nop
     4a4:	60 00 00 00 	nop
     4a8:	60 00 00 00 	nop
     4ac:	60 00 00 00 	nop
     4b0:	60 00 00 00 	nop
     4b4:	60 00 00 00 	nop
     4b8:	60 00 00 00 	nop
     4bc:	60 00 00 00 	nop
     4c0:	60 00 00 00 	nop
     4c4:	60 00 00 00 	nop
     4c8:	60 00 00 00 	nop
     4cc:	60 00 00 00 	nop
     4d0:	60 00 00 00 	nop
     4d4:	60 00 00 00 	nop
     4d8:	60 00 00 00 	nop
     4dc:	60 00 00 00 	nop
     4e0:	60 00 00 00 	nop
     4e4:	60 00 00 00 	nop
     4e8:	60 00 00 00 	nop
     4ec:	60 00 00 00 	nop
     4f0:	60 00 00 00 	nop
     4f4:	60 00 00 00 	nop
     4f8:	60 00 00 00 	nop
     4fc:	60 00 00 00 	nop
     500:	60 00 00 00 	nop
     504:	60 00 00 00 	nop
     508:	60 00 00 00 	nop
     50c:	60 00 00 00 	nop
     510:	60 00 00 00 	nop
     514:	60 00 00 00 	nop
     518:	60 00 00 00 	nop
     51c:	60 00 00 00 	nop
     520:	60 00 00 00 	nop
     524:	60 00 00 00 	nop
     528:	60 00 00 00 	nop
     52c:	60 00 00 00 	nop
     530:	60 00 00 00 	nop
     534:	60 00 00 00 	nop
     538:	60 00 00 00 	nop
     53c:	60 00 00 00 	nop
     540:	60 00 00 00 	nop
     544:	60 00 00 00 	nop
     548:	60 00 00 00 	nop
     54c:	60 00 00 00 	nop
     550:	60 00 00 00 	nop
     554:	60 00 00 00 	nop
     558:	60 00 00 00 	nop
     55c:	60 00 00 00 	nop
     560:	60 00 00 00 	nop
     564:	60 00 00 00 	nop
     568:	60 00 00 00 	nop
     56c:	60 00 00 00 	nop
     570:	60 00 00 00 	nop
     574:	60 00 00 00 	nop
     578:	60 00 00 00 	nop
     57c:	60 00 00 00 	nop
     580:	60 00 00 00 	nop
     584:	60 00 00 00 	nop
     588:	60 00 00 00 	nop
     58c:	60 00 00 00 	nop
     590:	60 00 00 00 	nop
     594:	60 00 00 00 	nop
     598:	60 00 00 00 	nop
     59c:	60 00 00 00 	nop
     5a0:	60 00 00 00 	nop
     5a4:	60 00 00 00 	nop
     5a8:	60 00 00 00 	nop
     5ac:	60 00 00 00 	nop
     5b0:	60 00 00 00 	nop
     5b4:	60 00 00 00 	nop
     5b8:	60 00 00 00 	nop
     5bc:	60 00 00 00 	nop
     5c0:	60 00 00 00 	nop
     5c4:	60 00 00 00 	nop
     5c8:	60 00 00 00 	nop
     5cc:	60 00 00 00 	nop
     5d0:	60 00 00 00 	nop
     5d4:	60 00 00 00 	nop
     5d8:	60 00 00 00 	nop
     5dc:	60 00 00 00 	nop
     5e0:	60 00 00 00 	nop
     5e4:	60 00 00 00 	nop
     5e8:	60 00 00 00 	nop
     5ec:	60 00 00 00 	nop
     5f0:	60 00 00 00 	nop
     5f4:	60 00 00 00 	nop
     5f8:	60 00 00 00 	nop
     5fc:	60 00 00 00 	nop
     600:	60 00 00 00 	nop
     604:	60 00 00 00 	nop
     608:	60 00 00 00 	nop
     60c:	60 00 00 00 	nop
     610:	60 00 00 00 	nop
     614:	60 00 00 00 	nop
     618:	60 00 00 00 	nop
     61c:	60 00 00 00 	nop
     620:	60 00 00 00 	nop
     624:	60 00 00 00 	nop
     628:	60 00 00 00 	nop
     62c:	60 00 00 00 	nop
     630:	60 00 00 00 	nop
     634:	60 00 00 00 	nop
     638:	60 00 00 00 	nop
     63c:	60 00 00 00 	nop
     640:	60 00 00 00 	nop
     644:	60 00 00 00 	nop
     648:	60 00 00 00 	nop
     64c:	60 00 00 00 	nop
     650:	60 00 00 00 	nop
     654:	60 00 00 00 	nop
     658:	60 00 00 00 	nop
     65c:	60 00 00 00 	nop
     660:	60 00 00 00 	nop
     664:	60 00 00 00 	nop
     668:	60 00 00 00 	nop
     66c:	60 00 00 00 	nop
     670:	60 00 00 00 	nop
     674:	60 00 00 00 	nop
     678:	60 00 00 00 	nop
     67c:	60 00 00 00 	nop
     680:	60 00 00 00 	nop
     684:	60 00 00 00 	nop
     688:	60 00 00 00 	nop
     68c:	60 00 00 00 	nop
     690:	60 00 00 00 	nop
     694:	60 00 00 00 	nop
     698:	60 00 00 00 	nop
     69c:	60 00 00 00 	nop
     6a0:	60 00 00 00 	nop
     6a4:	60 00 00 00 	nop
     6a8:	60 00 00 00 	nop
     6ac:	60 00 00 00 	nop
     6b0:	60 00 00 00 	nop
     6b4:	60 00 00 00 	nop
     6b8:	60 00 00 00 	nop
     6bc:	60 00 00 00 	nop
     6c0:	60 00 00 00 	nop
     6c4:	60 00 00 00 	nop
     6c8:	60 00 00 00 	nop
     6cc:	60 00 00 00 	nop
     6d0:	60 00 00 00 	nop
     6d4:	60 00 00 00 	nop
     6d8:	60 00 00 00 	nop
     6dc:	60 00 00 00 	nop
     6e0:	60 00 00 00 	nop
     6e4:	60 00 00 00 	nop
     6e8:	60 00 00 00 	nop
     6ec:	60 00 00 00 	nop
     6f0:	60 00 00 00 	nop
     6f4:	60 00 00 00 	nop
     6f8:	60 00 00 00 	nop
     6fc:	60 00 00 00 	nop
     700:	60 00 00 00 	nop
     704:	60 00 00 00 	nop
     708:	60 00 00 00 	nop
     70c:	60 00 00 00 	nop
     710:	60 00 00 00 	nop
     714:	60 00 00 00 	nop
     718:	60 00 00 00 	nop
     71c:	60 00 00 00 	nop
     720:	60 00 00 00 	nop
     724:	60 00 00 00 	nop
     728:	60 00 00 00 	nop
     72c:	60 00 00 00 	nop
     730:	60 00 00 00 	nop
     734:	60 00 00 00 	nop
     738:	60 00 00 00 	nop
     73c:	60 00 00 00 	nop
     740:	60 00 00 00 	nop
     744:	60 00 00 00 	nop
     748:	60 00 00 00 	nop
     74c:	60 00 00 00 	nop
     750:	60 00 00 00 	nop
     754:	60 00 00 00 	nop
     758:	60 00 00 00 	nop
     75c:	60 00 00 00 	nop
     760:	60 00 00 00 	nop
     764:	60 00 00 00 	nop
     768:	60 00 00 00 	nop
     76c:	60 00 00 00 	nop
     770:	60 00 00 00 	nop
     774:	60 00 00 00 	nop
     778:	60 00 00 00 	nop
     77c:	60 00 00 00 	nop
     780:	60 00 00 00 	nop
     784:	60 00 00 00 	nop
     788:	60 00 00 00 	nop
     78c:	60 00 00 00 	nop
     790:	60 00 00 00 	nop
     794:	60 00 00 00 	nop
     798:	60 00 00 00 	nop
     79c:	60 00 00 00 	nop
     7a0:	60 00 00 00 	nop
     7a4:	60 00 00 00 	nop
     7a8:	60 00 00 00 	nop
     7ac:	60 00 00 00 	nop
     7b0:	60 00 00 00 	nop
     7b4:	60 00 00 00 	nop
     7b8:	60 00 00 00 	nop
     7bc:	60 00 00 00 	nop
     7c0:	60 00 00 00 	nop
     7c4:	60 00 00 00 	nop
     7c8:	60 00 00 00 	nop
     7cc:	60 00 00 00 	nop
     7d0:	60 00 00 00 	nop
     7d4:	60 00 00 00 	nop
     7d8:	60 00 00 00 	nop
     7dc:	60 00 00 00 	nop
     7e0:	60 00 00 00 	nop
     7e4:	60 00 00 00 	nop
     7e8:	60 00 00 00 	nop
     7ec:	60 00 00 00 	nop
     7f0:	60 00 00 00 	nop
     7f4:	60 00 00 00 	nop
     7f8:	60 00 00 00 	nop
     7fc:	60 00 00 00 	nop
     800:	60 00 00 00 	nop
     804:	60 00 00 00 	nop
     808:	60 00 00 00 	nop
     80c:	60 00 00 00 	nop
     810:	60 00 00 00 	nop
     814:	60 00 00 00 	nop
     818:	60 00 00 00 	nop
     81c:	60 00 00 00 	nop
     820:	60 00 00 00 	nop
     824:	60 00 00 00 	nop
     828:	60 00 00 00 	nop
     82c:	60 00 00 00 	nop
     830:	60 00 00 00 	nop
     834:	60 00 00 00 	nop
     838:	60 00 00 00 	nop
     83c:	60 00 00 00 	nop
     840:	60 00 00 00 	nop
     844:	60 00 00 00 	nop
     848:	60 00 00 00 	nop
     84c:	60 00 00 00 	nop
     850:	60 00 00 00 	nop
     854:	60 00 00 00 	nop
     858:	60 00 00 00 	nop
     85c:	60 00 00 00 	nop
     860:	60 00 00 00 	nop
     864:	60 00 00 00 	nop
     868:	60 00 00 00 	nop
     86c:	60 00 00 00 	nop
     870:	60 00 00 00 	nop
     874:	60 00 00 00 	nop
     878:	60 00 00 00 	nop
     87c:	60 00 00 00 	nop
     880:	60 00 00 00 	nop
     884:	60 00 00 00 	nop
     888:	60 00 00 00 	nop
     88c:	60 00 00 00 	nop
     890:	60 00 00 00 	nop
     894:	60 00 00 00 	nop
     898:	60 00 00 00 	nop
     89c:	60 00 00 00 	nop
     8a0:	60 00 00 00 	nop
     8a4:	60 00 00 00 	nop
     8a8:	60 00 00 00 	nop
     8ac:	60 00 00 00 	nop
     8b0:	60 00 00 00 	nop
     8b4:	60 00 00 00 	nop
     8b8:	60 00 00 00 	nop
     8bc:	60 00 00 00 	nop
     8c0:	60 00 00 00 	nop
     8c4:	60 00 00 00 	nop
     8c8:	60 00 00 00 	nop
     8cc:	60 00 00 00 	nop
     8d0:	60 00 00 00 	nop
     8d4:	60 00 00 00 	nop
     8d8:	60 00 00 00 	nop
     8dc:	60 00 00 00 	nop
     8e0:	60 00 00 00 	nop
     8e4:	60 00 00 00 	nop
     8e8:	60 00 00 00 	nop
     8ec:	60 00 00 00 	nop
     8f0:	60 00 00 00 	nop
     8f4:	60 00 00 00 	nop
     8f8:	60 00 00 00 	nop
     8fc:	60 00 00 00 	nop
     900:	60 00 00 00 	nop
     904:	60 00 00 00 	nop
     908:	60 00 00 00 	nop
     90c:	60 00 00 00 	nop
     910:	60 00 00 00 	nop
     914:	60 00 00 00 	nop
     918:	60 00 00 00 	nop
     91c:	60 00 00 00 	nop
     920:	60 00 00 00 	nop
     924:	60 00 00 00 	nop
     928:	60 00 00 00 	nop
     92c:	60 00 00 00 	nop
     930:	60 00 00 00 	nop
     934:	60 00 00 00 	nop
     938:	60 00 00 00 	nop
     93c:	60 00 00 00 	nop
     940:	60 00 00 00 	nop
     944:	60 00 00 00 	nop
     948:	60 00 00 00 	nop
     94c:	60 00 00 00 	nop
     950:	60 00 00 00 	nop
     954:	60 00 00 00 	nop
     958:	60 00 00 00 	nop
     95c:	60 00 00 00 	nop
     960:	60 00 00 00 	nop
     964:	60 00 00 00 	nop
     968:	60 00 00 00 	nop
     96c:	60 00 00 00 	nop
     970:	60 00 00 00 	nop
     974:	60 00 00 00 	nop
     978:	60 00 00 00 	nop
     97c:	60 00 00 00 	nop
     980:	60 00 00 00 	nop
     984:	60 00 00 00 	nop
     988:	60 00 00 00 	nop
     98c:	60 00 00 00 	nop
     990:	60 00 00 00 	nop
     994:	60 00 00 00 	nop
     998:	60 00 00 00 	nop
     99c:	60 00 00 00 	nop
     9a0:	60 00 00 00 	nop
     9a4:	60 00 00 00 	nop
     9a8:	60 00 00 00 	nop
     9ac:	60 00 00 00 	nop
     9b0:	60 00 00 00 	nop
     9b4:	60 00 00 00 	nop
     9b8:	60 00 00 00 	nop
     9bc:	60 00 00 00 	nop
     9c0:	60 00 00 00 	nop
     9c4:	60 00 00 00 	nop
     9c8:	60 00 00 00 	nop
     9cc:	60 00 00 00 	nop
     9d0:	60 00 00 00 	nop
     9d4:	60 00 00 00 	nop
     9d8:	60 00 00 00 	nop
     9dc:	60 00 00 00 	nop
     9e0:	60 00 00 00 	nop
     9e4:	60 00 00 00 	nop
     9e8:	60 00 00 00 	nop
     9ec:	60 00 00 00 	nop
     9f0:	60 00 00 00 	nop
     9f4:	60 00 00 00 	nop
     9f8:	60 00 00 00 	nop
     9fc:	60 00 00 00 	nop
     a00:	60 00 00 00 	nop
     a04:	60 00 00 00 	nop
     a08:	60 00 00 00 	nop
     a0c:	60 00 00 00 	nop
     a10:	60 00 00 00 	nop
     a14:	60 00 00 00 	nop
     a18:	60 00 00 00 	nop
     a1c:	60 00 00 00 	nop
     a20:	60 00 00 00 	nop
     a24:	60 00 00 00 	nop
     a28:	60 00 00 00 	nop
     a2c:	60 00 00 00 	nop
     a30:	60 00 00 00 	nop
     a34:	60 00 00 00 	nop
     a38:	60 00 00 00 	nop
     a3c:	60 00 00 00 	nop
     a40:	60 00 00 00 	nop
     a44:	60 00 00 00 	nop
     a48:	60 00 00 00 	nop
     a4c:	60 00 00 00 	nop
     a50:	60 00 00 00 	nop
     a54:	60 00 00 00 	nop
     a58:	60 00 00 00 	nop
     a5c:	60 00 00 00 	nop
     a60:	60 00 00 00 	nop
     a64:	60 00 00 00 	nop
     a68:	60 00 00 00 	nop
     a6c:	60 00 00 00 	nop
     a70:	60 00 00 00 	nop
     a74:	60 00 00 00 	nop
     a78:	60 00 00 00 	nop
     a7c:	60 00 00 00 	nop
     a80:	60 00 00 00 	nop
     a84:	60 00 00 00 	nop
     a88:	60 00 00 00 	nop
     a8c:	60 00 00 00 	nop
     a90:	60 00 00 00 	nop
     a94:	60 00 00 00 	nop
     a98:	60 00 00 00 	nop
     a9c:	60 00 00 00 	nop
     aa0:	60 00 00 00 	nop
     aa4:	60 00 00 00 	nop
     aa8:	60 00 00 00 	nop
     aac:	60 00 00 00 	nop
     ab0:	60 00 00 00 	nop
     ab4:	60 00 00 00 	nop
     ab8:	60 00 00 00 	nop
     abc:	60 00 00 00 	nop
     ac0:	60 00 00 00 	nop
     ac4:	60 00 00 00 	nop
     ac8:	60 00 00 00 	nop
     acc:	60 00 00 00 	nop
     ad0:	60 00 00 00 	nop
     ad4:	60 00 00 00 	nop
     ad8:	60 00 00 00 	nop
     adc:	60 00 00 00 	nop
     ae0:	60 00 00 00 	nop
     ae4:	60 00 00 00 	nop
     ae8:	60 00 00 00 	nop
     aec:	60 00 00 00 	nop
     af0:	60 00 00 00 	nop
     af4:	60 00 00 00 	nop
     af8:	60 00 00 00 	nop
     afc:	60 00 00 00 	nop
     b00:	60 00 00 00 	nop
     b04:	60 00 00 00 	nop
     b08:	60 00 00 00 	nop
     b0c:	60 00 00 00 	nop
     b10:	60 00 00 00 	nop
     b14:	60 00 00 00 	nop
     b18:	60 00 00 00 	nop
     b1c:	60 00 00 00 	nop
     b20:	60 00 00 00 	nop
     b24:	60 00 00 00 	nop
     b28:	60 00 00 00 	nop
     b2c:	60 00 00 00 	nop
     b30:	60 00 00 00 	nop
     b34:	60 00 00 00 	nop
     b38:	60 00 00 00 	nop
     b3c:	60 00 00 00 	nop
     b40:	60 00 00 00 	nop
     b44:	60 00 00 00 	nop
     b48:	60 00 00 00 	nop
     b4c:	60 00 00 00 	nop
     b50:	60 00 00 00 	nop
     b54:	60 00 00 00 	nop
     b58:	60 00 00 00 	nop
     b5c:	60 00 00 00 	nop
     b60:	60 00 00 00 	nop
     b64:	60 00 00 00 	nop
     b68:	60 00 00 00 	nop
     b6c:	60 00 00 00 	nop
     b70:	60 00 00 00 	nop
     b74:	60 00 00 00 	nop
     b78:	60 00 00 00 	nop
     b7c:	60 00 00 00 	nop
     b80:	60 00 00 00 	nop
     b84:	60 00 00 00 	nop
     b88:	60 00 00 00 	nop
     b8c:	60 00 00 00 	nop
     b90:	60 00 00 00 	nop
     b94:	60 00 00 00 	nop
     b98:	60 00 00 00 	nop
     b9c:	60 00 00 00 	nop
     ba0:	60 00 00 00 	nop
     ba4:	60 00 00 00 	nop
     ba8:	60 00 00 00 	nop
     bac:	60 00 00 00 	nop
     bb0:	60 00 00 00 	nop
     bb4:	60 00 00 00 	nop
     bb8:	60 00 00 00 	nop
     bbc:	60 00 00 00 	nop
     bc0:	60 00 00 00 	nop
     bc4:	60 00 00 00 	nop
     bc8:	60 00 00 00 	nop
     bcc:	60 00 00 00 	nop
     bd0:	60 00 00 00 	nop
     bd4:	60 00 00 00 	nop
     bd8:	60 00 00 00 	nop
     bdc:	60 00 00 00 	nop
     be0:	60 00 00 00 	nop
     be4:	60 00 00 00 	nop
     be8:	60 00 00 00 	nop
     bec:	60 00 00 00 	nop
     bf0:	60 00 00 00 	nop
     bf4:	60 00 00 00 	nop
     bf8:	60 00 00 00 	nop
     bfc:	60 00 00 00 	nop
     c00:	60 00 00 00 	nop
     c04:	60 00 00 00 	nop
     c08:	60 00 00 00 	nop
     c0c:	60 00 00 00 	nop
     c10:	60 00 00 00 	nop
     c14:	60 00 00 00 	nop
     c18:	60 00 00 00 	nop
     c1c:	60 00 00 00 	nop
     c20:	60 00 00 00 	nop
     c24:	60 00 00 00 	nop
     c28:	60 00 00 00 	nop
     c2c:	60 00 00 00 	nop
     c30:	60 00 00 00 	nop
     c34:	60 00 00 00 	nop
     c38:	60 00 00 00 	nop
     c3c:	60 00 00 00 	nop
     c40:	60 00 00 00 	nop
     c44:	60 00 00 00 	nop
     c48:	60 00 00 00 	nop
     c4c:	60 00 00 00 	nop
     c50:	60 00 00 00 	nop
     c54:	60 00 00 00 	nop
     c58:	60 00 00 00 	nop
     c5c:	60 00 00 00 	nop
     c60:	60 00 00 00 	nop
     c64:	60 00 00 00 	nop
     c68:	60 00 00 00 	nop
     c6c:	60 00 00 00 	nop
     c70:	60 00 00 00 	nop
     c74:	60 00 00 00 	nop
     c78:	60 00 00 00 	nop
     c7c:	60 00 00 00 	nop
     c80:	60 00 00 00 	nop
     c84:	60 00 00 00 	nop
     c88:	60 00 00 00 	nop
     c8c:	60 00 00 00 	nop
     c90:	60 00 00 00 	nop
     c94:	60 00 00 00 	nop
     c98:	60 00 00 00 	nop
     c9c:	60 00 00 00 	nop
     ca0:	60 00 00 00 	nop
     ca4:	60 00 00 00 	nop
     ca8:	60 00 00 00 	nop
     cac:	60 00 00 00 	nop
     cb0:	60 00 00 00 	nop
     cb4:	60 00 00 00 	nop
     cb8:	60 00 00 00 	nop
     cbc:	60 00 00 00 	nop
     cc0:	60 00 00 00 	nop
     cc4:	60 00 00 00 	nop
     cc8:	60 00 00 00 	nop
     ccc:	60 00 00 00 	nop
     cd0:	60 00 00 00 	nop
     cd4:	60 00 00 00 	nop
     cd8:	60 00 00 00 	nop
     cdc:	60 00 00 00 	nop
     ce0:	60 00 00 00 	nop
     ce4:	60 00 00 00 	nop
     ce8:	60 00 00 00 	nop
     cec:	60 00 00 00 	nop
     cf0:	60 00 00 00 	nop
     cf4:	60 00 00 00 	nop
     cf8:	60 00 00 00 	nop
     cfc:	60 00 00 00 	nop
     d00:	60 00 00 00 	nop
     d04:	60 00 00 00 	nop
     d08:	60 00 00 00 	nop
     d0c:	60 00 00 00 	nop
     d10:	60 00 00 00 	nop
     d14:	60 00 00 00 	nop
     d18:	60 00 00 00 	nop
     d1c:	60 00 00 00 	nop
     d20:	60 00 00 00 	nop
     d24:	60 00 00 00 	nop
     d28:	60 00 00 00 	nop
     d2c:	60 00 00 00 	nop
     d30:	60 00 00 00 	nop
     d34:	60 00 00 00 	nop
     d38:	60 00 00 00 	nop
     d3c:	60 00 00 00 	nop
     d40:	60 00 00 00 	nop
     d44:	60 00 00 00 	nop
     d48:	60 00 00 00 	nop
     d4c:	60 00 00 00 	nop
     d50:	60 00 00 00 	nop
     d54:	60 00 00 00 	nop
     d58:	60 00 00 00 	nop
     d5c:	60 00 00 00 	nop
     d60:	60 00 00 00 	nop
     d64:	60 00 00 00 	nop
     d68:	60 00 00 00 	nop
     d6c:	60 00 00 00 	nop
     d70:	60 00 00 00 	nop
     d74:	60 00 00 00 	nop
     d78:	60 00 00 00 	nop
     d7c:	60 00 00 00 	nop
     d80:	60 00 00 00 	nop
     d84:	60 00 00 00 	nop
     d88:	60 00 00 00 	nop
     d8c:	60 00 00 00 	nop
     d90:	60 00 00 00 	nop
     d94:	60 00 00 00 	nop
     d98:	60 00 00 00 	nop
     d9c:	60 00 00 00 	nop
     da0:	60 00 00 00 	nop
     da4:	60 00 00 00 	nop
     da8:	60 00 00 00 	nop
     dac:	60 00 00 00 	nop
     db0:	60 00 00 00 	nop
     db4:	60 00 00 00 	nop
     db8:	60 00 00 00 	nop
     dbc:	60 00 00 00 	nop
     dc0:	60 00 00 00 	nop
     dc4:	60 00 00 00 	nop
     dc8:	60 00 00 00 	nop
     dcc:	60 00 00 00 	nop
     dd0:	60 00 00 00 	nop
     dd4:	60 00 00 00 	nop
     dd8:	60 00 00 00 	nop
     ddc:	60 00 00 00 	nop
     de0:	60 00 00 00 	nop
     de4:	60 00 00 00 	nop
     de8:	60 00 00 00 	nop
     dec:	60 00 00 00 	nop
     df0:	60 00 00 00 	nop
     df4:	60 00 00 00 	nop
     df8:	60 00 00 00 	nop
     dfc:	60 00 00 00 	nop
     e00:	60 00 00 00 	nop
     e04:	60 00 00 00 	nop
     e08:	60 00 00 00 	nop
     e0c:	60 00 00 00 	nop
     e10:	60 00 00 00 	nop
     e14:	60 00 00 00 	nop
     e18:	60 00 00 00 	nop
     e1c:	60 00 00 00 	nop
     e20:	60 00 00 00 	nop
     e24:	60 00 00 00 	nop
     e28:	60 00 00 00 	nop
     e2c:	60 00 00 00 	nop
     e30:	60 00 00 00 	nop
     e34:	60 00 00 00 	nop
     e38:	60 00 00 00 	nop
     e3c:	60 00 00 00 	nop
     e40:	60 00 00 00 	nop
     e44:	60 00 00 00 	nop
     e48:	60 00 00 00 	nop
     e4c:	60 00 00 00 	nop
     e50:	60 00 00 00 	nop
     e54:	60 00 00 00 	nop
     e58:	60 00 00 00 	nop
     e5c:	60 00 00 00 	nop
     e60:	60 00 00 00 	nop
     e64:	60 00 00 00 	nop
     e68:	60 00 00 00 	nop
     e6c:	60 00 00 00 	nop
     e70:	60 00 00 00 	nop
     e74:	60 00 00 00 	nop
     e78:	60 00 00 00 	nop
     e7c:	60 00 00 00 	nop
     e80:	60 00 00 00 	nop
     e84:	60 00 00 00 	nop
     e88:	60 00 00 00 	nop
     e8c:	60 00 00 00 	nop
     e90:	60 00 00 00 	nop
     e94:	60 00 00 00 	nop
     e98:	60 00 00 00 	nop
     e9c:	60 00 00 00 	nop
     ea0:	60 00 00 00 	nop
     ea4:	60 00 00 00 	nop
     ea8:	60 00 00 00 	nop
     eac:	60 00 00 00 	nop
     eb0:	60 00 00 00 	nop
     eb4:	60 00 00 00 	nop
     eb8:	60 00 00 00 	nop
     ebc:	60 00 00 00 	nop
     ec0:	60 00 00 00 	nop
     ec4:	60 00 00 00 	nop
     ec8:	60 00 00 00 	nop
     ecc:	60 00 00 00 	nop
     ed0:	60 00 00 00 	nop
     ed4:	60 00 00 00 	nop
     ed8:	60 00 00 00 	nop
     edc:	60 00 00 00 	nop
     ee0:	60 00 00 00 	nop
     ee4:	60 00 00 00 	nop
     ee8:	60 00 00 00 	nop
     eec:	60 00 00 00 	nop
     ef0:	60 00 00 00 	nop
     ef4:	60 00 00 00 	nop
     ef8:	60 00 00 00 	nop
     efc:	60 00 00 00 	nop
     f00:	60 00 00 00 	nop
     f04:	60 00 00 00 	nop
     f08:	60 00 00 00 	nop
     f0c:	60 00 00 00 	nop
     f10:	60 00 00 00 	nop
     f14:	60 00 00 00 	nop
     f18:	60 00 00 00 	nop
     f1c:	60 00 00 00 	nop
     f20:	60 00 00 00 	nop
     f24:	60 00 00 00 	nop
     f28:	60 00 00 00 	nop
     f2c:	60 00 00 00 	nop
     f30:	60 00 00 00 	nop
     f34:	60 00 00 00 	nop
     f38:	60 00 00 00 	nop
     f3c:	60 00 00 00 	nop
     f40:	60 00 00 00 	nop
     f44:	60 00 00 00 	nop
     f48:	60 00 00 00 	nop
     f4c:	60 00 00 00 	nop
     f50:	60 00 00 00 	nop
     f54:	60 00 00 00 	nop
     f58:	60 00 00 00 	nop
     f5c:	60 00 00 00 	nop
     f60:	60 00 00 00 	nop
     f64:	60 00 00 00 	nop
     f68:	60 00 00 00 	nop
     f6c:	60 00 00 00 	nop
     f70:	60 00 00 00 	nop
     f74:	60 00 00 00 	nop
     f78:	60 00 00 00 	nop
     f7c:	60 00 00 00 	nop
     f80:	60 00 00 00 	nop
     f84:	60 00 00 00 	nop
     f88:	60 00 00 00 	nop
     f8c:	60 00 00 00 	nop
     f90:	60 00 00 00 	nop
     f94:	60 00 00 00 	nop
     f98:	60 00 00 00 	nop
     f9c:	60 00 00 00 	nop
     fa0:	60 00 00 00 	nop
     fa4:	60 00 00 00 	nop
     fa8:	60 00 00 00 	nop
     fac:	60 00 00 00 	nop
     fb0:	60 00 00 00 	nop
     fb4:	60 00 00 00 	nop
     fb8:	60 00 00 00 	nop
     fbc:	60 00 00 00 	nop
     fc0:	60 00 00 00 	nop
     fc4:	60 00 00 00 	nop
     fc8:	60 00 00 00 	nop
     fcc:	60 00 00 00 	nop
     fd0:	60 00 00 00 	nop
     fd4:	60 00 00 00 	nop
     fd8:	60 00 00 00 	nop
     fdc:	60 00 00 00 	nop
     fe0:	60 00 00 00 	nop
     fe4:	60 00 00 00 	nop
     fe8:	60 00 00 00 	nop
     fec:	60 00 00 00 	nop
     ff0:	60 00 00 00 	nop
     ff4:	60 00 00 00 	nop
     ff8:	60 00 00 00 	nop
     ffc:	60 00 00 00 	nop
    1000:	57 54 46 21 	rlwinm. r20,r26,8,24,16
    1004:	20 79 3d 7b 	subfic  r3,r25,15739
    1008:	7d 00 00 00 	cmpw    cr2,r0,r0
    100c:	4e 80 00 21 	blrl

00001010 <_GLOBAL_OFFSET_TABLE_>:
	...

Disassembly of section .rela.dyn:

00001038 <.rela.dyn>:
    1038:	00 00 10 1c 	.long 0x101c
    103c:	00 00 00 16 	.long 0x16
    1040:	00 00 10 00 	.long 0x1000
    1044:	00 00 10 20 	.long 0x1020
    1048:	00 00 00 16 	.long 0x16
    104c:	00 01 00 28 	.long 0x10028
    1050:	00 00 10 24 	.long 0x1024
    1054:	00 00 00 16 	.long 0x16
    1058:	00 01 00 28 	.long 0x10028
    105c:	00 00 10 28 	.long 0x1028
    1060:	00 00 00 16 	.long 0x16
    1064:	00 00 10 f4 	.long 0x10f4
    1068:	00 00 10 2c 	.long 0x102c
    106c:	00 00 00 16 	.long 0x16
    1070:	00 00 10 d8 	.long 0x10d8
    1074:	00 00 10 30 	.long 0x1030
    1078:	00 00 00 16 	.long 0x16
    107c:	00 01 00 00 	.long 0x10000
    1080:	00 00 10 dc 	.long 0x10dc
    1084:	00 00 00 16 	.long 0x16
    1088:	00 00 02 ec 	.long 0x2ec
    108c:	00 00 10 e0 	.long 0x10e0
    1090:	00 00 00 16 	.long 0x16
    1094:	00 00 02 c0 	.long 0x2c0
    1098:	00 00 10 e8 	.long 0x10e8
    109c:	00 00 00 16 	.long 0x16
    10a0:	00 00 10 d8 	.long 0x10d8
    10a4:	00 00 10 ec 	.long 0x10ec
    10a8:	00 00 00 16 	.long 0x16
    10ac:	00 00 10 d8 	.long 0x10d8
    10b0:	00 00 10 f0 	.long 0x10f0
    10b4:	00 00 00 16 	.long 0x16
    10b8:	00 00 10 d8 	.long 0x10d8
    10bc:	00 00 02 4e 	.long 0x24e
    10c0:	00 00 01 06 	.long 0x106
    10c4:	00 00 10 f0 	.long 0x10f0
    10c8:	00 00 02 5e 	.long 0x25e
    10cc:	00 00 01 04 	.long 0x104
    10d0:	00 00 10 f0 	.long 0x10f0

Disassembly of section .data:

000010d4 <__stdio-0x4>:
    10d4:	00 00 00 00 	.long 0x0

000010d8 <__stdio>:
    10d8:	00 00 03 00 	.long 0x300
	...

000010e8 <stdin>:
    10e8:	00 00 00 00 	.long 0x0

000010ec <stderr>:
    10ec:	00 00 00 00 	.long 0x0

000010f0 <stdout>:
    10f0:	00 00 00 00 	.long 0x0

000010f4 <_edata>:
    10f4:	00 00 00 00 	.long 0x0

Disassembly of section .bss:

00010024 <_ebss-0x4>:
   10024:	00 00 00 00 	.long 0x0
