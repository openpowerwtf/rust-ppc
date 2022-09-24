#![feature(asm_experimental_arch)]

#![no_std]
#![no_main]

extern crate rt;
use::rt::printf;

#[no_mangle]
pub fn main() -> ! {
   let mut  y:u32 = 0;
   y = wtf();

   unsafe {
      printf(b"WTF! y={}\n" as *const u8, y);
   }

   loop {}
}

#[no_mangle]
pub fn wtf() -> u32 {
   use core::arch::asm;
   let mut x: u32 = 0;
   unsafe {
      asm! (
         "cmpwi {x},0",
         "lis  {x},2151",
         "ori  {x},{x},21257",
         /* x = in(reg) x */
         /* x = out(reg) x */
         x = inout(reg) x => x
      );
   }
   x
}

