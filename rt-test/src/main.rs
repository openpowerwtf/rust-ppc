#![feature(asm_experimental_arch)]

#![no_std]
#![no_main]

extern crate rt;

#[no_mangle]
pub fn main() -> ! {
   let mut x = 0x8675309;
   let mut  y:u32 = 0;
   y = wtf();
   //x = x + y; memcpy, etc. not found???
   loop {}
}

// works with feature and nightly
// asm! is inline to function
// global_asm! is in global scope, outside of function
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
   //x += 1;  memcpy, etc. not found???
   x
}

