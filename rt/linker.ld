ENTRY (_start)

MEMORY
{
  ROM : ORIGIN = 0x00000000, LENGTH = 64K
  RAM : ORIGIN = 0x00010000, LENGTH = 64K
}

PHDRS { }

SECTIONS {

   . = 0x00000000;

   .boot : {
      KEEP(*(.bootstub))
      KEEP(*(.boot))
      /* . = ALIGN(0x1000); need to get rid of nops! */
   } > ROM

   .rt.config : {
      KEEP(*(.rt.config))
    } > ROM

   .rt : {
      KEEP(*(.rt))
   } > ROM

   .kernel : {
      . = ALIGN(32);
      *(.text .text* .gnu.linkonce.t.*)
      . = ALIGN(4);
   } > ROM

   .rodata : {
      . = ALIGN(0x1000);
		*(.rodata .rodata.* .gnu.linkonce.r.*)
		*(.rodata1)
		*(.got .got.*)
		*(.got2 .got2.*)
		*(.toc .toc.*)
		FILL(0);
		. = ALIGN(8);
   } > ROM

   /*.data : AT(ADDR(.rodata) + SIZEOF(.rodata)) {*/
   .data : {
      . = ALIGN(8);
       _sdata = .;
		*(.data .data.* .sdata .gnu.linkonce.d.*)
       _edata = .;
		FILL(0);
		. = ALIGN(8);
   } > ROM AT > RAM

   .bss : {
      . = ALIGN(8); /*relative to start of ram!*/
      _sbss = .;
		*(.dynsbss)
		*(.sbss .sbss.* .gnu.linkonce.sb.*)
		*(.scommon)
		*(.dynbss)
		*(.bss .bss.* .gnu.linkonce.b.*)
		*(COMMON)
      _ebss = .;
   } > RAM

   /*_got = LOADADDR(.got); not pointing correctly when setting up r30 i think; try rodata */
   _got = LOADADDR(.rodata);

   _sidata = LOADADDR(.data);
   _end = .;

   _stack_size = 0x00010000;
   _stack_0 = ORIGIN(RAM) + LENGTH(RAM) - 8;
   _stack_1 = _stack_0 - _stack_size;

	/DISCARD/ : {
      *(.interp)
      *(.debug*)
		*(.comment)

       /**(.rela.dyn)  wont delete it */

      *(.gnu.hash)
      *(.hash*)
		*(.dyn*)
	}

}