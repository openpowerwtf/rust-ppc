#![no_std]
#![no_main]

use core::panic::PanicInfo;

/*
<https://github.com/rust-lang/rust/issues/93335>


mod start {
   use core::arch::global_asm;
   global_asm! {
      "[section .text._start"
   }
}
*/

#[no_mangle]
pub extern "C" fn _start() -> !{
   loop {}
}

#[panic_handler]
fn panic (_info: &PanicInfo) -> ! {
   loop {}
}

