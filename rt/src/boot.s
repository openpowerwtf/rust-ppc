.section .bootstub

#.include "defines.s"
.set r1,1
.set r30,30

.global _start

_start:
      lis      r1,_stack_0@h
      ori      r1,r1,_stack_0@l
      #lis      r30,_GLOBAL_OFFSET_TABLE_@h
      #ori      r30,r30,_GLOBAL_OFFSET_TABLE_@l
      lis      r30,_got@h
      ori      r30,r30,_got@l

      bl       Reset
      b        .

# save/restore for 32b libc

.macro GLOBAL n
   .type       \n,@function
	.global     \n
\n:
.endm

.section .rt
# saves for 32b libc

GLOBAL _savegpr_16
	stw	16,-64(11)

GLOBAL _savegpr_17
	stw	17,-60(11)

GLOBAL _savegpr_18
	stw	18,-56(11)

GLOBAL _savegpr_19
	stw	19,-52(11)

GLOBAL _savegpr_20
	stw	20,-48(11)

GLOBAL _savegpr_21
	stw	21,-44(11)

GLOBAL _savegpr_22
	stw	22,-40(11)

GLOBAL _savegpr_23
	stw	23,-36(11)

GLOBAL _savegpr_24
	stw	24,-32(11)

GLOBAL _savegpr_25
	stw	25,-28(11)

GLOBAL _savegpr_26
	stw	26,-24(11)

GLOBAL _savegpr_27
	stw	27,-20(11)

GLOBAL _savegpr_28
	stw	28,-16(11)

GLOBAL _savegpr_29
	stw	29,-12(11)

GLOBAL _savegpr_30
	stw	30,-8(11)

GLOBAL _savegpr_31
	stw	31,-4(11)
	blr

# restores

GLOBAL _restgpr_16_x
GLOBAL _rest32gpr_16_x
	lwz	16,-64(11)

GLOBAL _restgpr_17_x
GLOBAL _rest32gpr_17_x
	lwz	17,-60(11)

GLOBAL _restgpr_18_x
GLOBAL _rest32gpr_18_x
	lwz	18,-56(11)

GLOBAL _restgpr_19_x
GLOBAL _rest32gpr_19_x
	lwz	19,-52(11)

GLOBAL _restgpr_20_x
GLOBAL _rest32gpr_20_x
	lwz	20,-48(11)

GLOBAL _restgpr_21_x
GLOBAL _rest32gpr_21_x
	lwz	21,-44(11)

GLOBAL _restgpr_22_x
GLOBAL _rest32gpr_22_x
	lwz	22,-40(11)

GLOBAL _restgpr_23_x
GLOBAL _rest32gpr_23_x
	lwz	23,-36(11)

GLOBAL _restgpr_24_x
GLOBAL _rest32gpr_24_x
	lwz	24,-32(11)

GLOBAL _restgpr_25_x
GLOBAL _rest32gpr_25_x
	lwz	25,-28(11)

GLOBAL _restgpr_26_x
GLOBAL _rest32gpr_26_x
	lwz	26,-24(11)

GLOBAL _restgpr_27_x
GLOBAL _rest32gpr_27_x
	lwz	27,-20(11)

GLOBAL _restgpr_28_x
GLOBAL _rest32gpr_28_x
	lwz	28,-16(11)

GLOBAL _restgpr_29_x
GLOBAL _rest32gpr_29_x
	lwz	29,-12(11)

GLOBAL _restgpr_30_x
GLOBAL _rest32gpr_30_x
	lwz	30,-8(11)

GLOBAL _restgpr_31_x
GLOBAL _rest32gpr_31_x
	lwz	0,4(11)
	lwz	31,-4(11)
	mtlr	0
	mr	   1,11
	blr


# gets tossed when not used - is rust compiling/assembling with some different optimizing option???
# "powerpc-linux-gnu-ld" "/tmp/rustcSfTOcJ/symbols.o"
# "/data/projects/rust-ppc/rt-test/target/powerpc-unknown-linux-gnu/debug/deps/rt_test-14245a5e1bc66f85.11ewfoatgqky4hxc.rcgu.o"
# "--as-needed"
# "-L" "/data/projects/rust-ppc/rt-test/target/powerpc-unknown-linux-gnu/debug/deps"
# "-L" "/data/projects/rust-ppc/rt-test/target/debug/deps"
# "-L" "/data/projects/rust-ppc/rt-test/target/powerpc-unknown-linux-gnu/debug/build/rt-3f9637dd29c6fddb/out"
# "-L" "/home/wtf/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/powerpc-unknown-linux-gnu/lib"
#  "-Bstatic"
#  "/data/projects/rust-ppc/rt-test/target/powerpc-unknown-linux-gnu/debug/deps/librt-b7ca7f47c19e2e6d.rlib"
# "/home/wtf/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/powerpc-unknown-linux-gnu/lib/librustc_std_workspace_core-6ce04bac71ecd2e9.rlib"
# "/home/wtf/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/powerpc-unknown-linux-gnu/lib/libcore-7063a87e0c7d6512.rlib"
# "/home/wtf/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/powerpc-unknown-linux-gnu/lib/libcompiler_builtins-25e31706808e5b6c.rlib"
# "-Bdynamic" "--eh-frame-hdr" "-znoexecstack"
# "-L" "/home/wtf/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/powerpc-unknown-linux-gnu/lib"
# "-o" "/data/projects/rust-ppc/rt-test/target/powerpc-unknown-linux-gnu/debug/deps/rt_test-14245a5e1bc66f85"
# "--gc-sections" "-pie" "-zrelro" "-znow" "--script=./linker.ld"


.section .rodata
_bootinfo:  .long 0x08675309