#![no_std]

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
pub unsafe extern "C" fn Reset() -> ! {
   extern "Rust" {
       fn main() -> !;
   }

   main()
}

#[panic_handler]
fn panic (_info: &PanicInfo) -> ! {
   loop {}
}

// The reset vector, a pointer into the reset handler
#[link_section = ".vector_table.reset_vector"]
#[no_mangle]
pub static RESET_VECTOR: unsafe extern "C" fn() -> ! = Reset;

/* needs nightly
#![feature(lang_items)]

#[lang = "eh_personality"]
extern "C" fn eh_personality() {}
*/