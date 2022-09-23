ENTRY(Reset)

PHDRS { }

SECTIONS {

   . = 0x00000000;

   .boot : {
      *(.rt)
   }

   . = ALIGN(1024);

   .text : {
      *(.text .text.*)
   }

   .rodata : {
      *(.rodata)
   }

   __bss_start = .;

   .bss : {
      bss = .;
      *(.bss)
   }

   __bss_end = .;
   __bss_size = __bss_end - __bss_start;
   __end = .;

	/DISCARD/ :
	{
		*(.interp)
		*(.dyn*)
      *(.hash*)
      *(.debug*)
      *(.gnu*)
	}

}