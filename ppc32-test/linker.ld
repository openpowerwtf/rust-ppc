ENTRY(_start)

PHDRS { }

SECTIONS {

   . = 0x00000000;

   .text : {
      *(.text._start)
      *(.text*)
   }

   . = ALIGN(1024);

   .rodata : {
      *(.rodata)
   }

   . = ALIGN(1024);

   __bss_start = .;

   .bss : {
      bss = .;
      *(.bss)
   }

   . = ALIGN(4096);
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