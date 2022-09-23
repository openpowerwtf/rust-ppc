#![no_std]

use core::panic::PanicInfo;

/*
<https://github.com/rust-lang/rust/issues/93335>


mod start {
   use core::arch::global_asm;
   global_asm! {
      "[section .rt"
   }
}
*/
// boot to @0
#[link_section = ".rt"]

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

/* needs nightly
#![feature(lang_items)]

#[lang = "eh_personality"]
extern "C" fn eh_personality() {}
*/