#![feature(asm_experimental_arch)]
#![feature(naked_functions)]
#![no_std]

use core::panic::PanicInfo;
use core::arch::global_asm;

// until i can get link vars into inline asm
global_asm!(include_str!("boot.s"));

#[link_section = ".boot"]
#[panic_handler]
fn panic (_info: &PanicInfo) -> ! {
   loop {}
}


// ************* runtime stuff **************************
use core::ffi::*;

#[link_section = ".rt"]
static MAGIC: [u8;32] = *b"A Vulgar Display of OpenPower...";
/*
csr_base,uart,0xfff04000,,
csr_register,uart_rxtx,0xfff04000,1,rw
csr_register,uart_txfull,0xfff04004,1,ro
csr_register,uart_rxempty,0xfff04008,1,ro
csr_register,uart_ev_status,0xfff0400c,1,ro
csr_register,uart_ev_pending,0xfff04010,1,rw
csr_register,uart_ev_enable,0xfff04014,1,rw
csr_register,uart_txempty,0xfff04018,1,ro
csr_register,uart_rxfull,0xfff0401c,1,ro
*/
static UART_BASE: u32 = 0xfff04000;
static CONFIG_END: u32 = 0x08675309;

/*
char uart_read(void)
{
	char c;
	while (uart_rxempty_read());
	c = uart_rxtx_read();
	uart_ev_pending_write(UART_EV_RX);
	return c;
}

int uart_read_nonblock(void)
{
	return (uart_rxempty_read() == 0);
}

void uart_write(char c)
{
	while (uart_txfull_read());
	uart_rxtx_write(c);
	uart_ev_pending_write(UART_EV_TX);
}

void uart_init(void)
{
	uart_ev_pending_write(uart_ev_pending_read());
	uart_ev_enable_write(UART_EV_TX | UART_EV_RX);
}

void uart_sync(void)
{
	while (uart_txfull_read());
}
 */

#[link_section = ".rt"]
#[no_mangle]
unsafe fn uart_init() {
   let v:u32 = 1;
   let mut ch:u32 = core::ptr::read_volatile((UART_BASE + 0x00000010) as *const u32);
   core::ptr::write((UART_BASE + 0x00000010) as *mut u32, ch);
   core::ptr::write((UART_BASE + 0x00000014) as *mut u32, 3);
   /*
   lis r10,UART_BASE@h
   ori r10,r10,UART_BASE@l
   lwz r11,0(r10)
   stw r11,0(r10)
   li  r11,3
   stw r11,4(r10)
    */

}

#[link_section = ".rt"]
#[no_mangle]
unsafe fn uart_sync() {
   while (core::ptr::read_volatile((UART_BASE + 0x00000004) as *const u32) != 0) {};
   /*
   lis r10,UART_BASE@h
   ori r10,r10,UART_BASE@l
   lwz r11,0(r10)
   cmpwi r11,0
   bne -8
   */
}

#[link_section = ".rt"]
#[no_mangle]
pub unsafe extern "C" fn uart_write(ch: u8) {
   while (core::ptr::read_volatile((UART_BASE + 0x00000004) as *const u32) != 0) {};
   core::ptr::write((UART_BASE + 0x00000000) as *mut u32, ch as u32);
   core::ptr::write((UART_BASE + 0x00000010) as *mut u32, 1);
   /*
00004854 <uart_write>:
    4854:	3d 40 ff f0 	lis     r10,-16
    4858:	61 4a 40 04 	ori     r10,r10,16388
    485c:	81 2a 00 00 	lwz     r9,0(r10)
    4860:	2c 09 00 00 	cmpwi   r9,0
    4864:	40 82 ff f8 	bne     485c <uart_write+0x8>
    4868:	3d 20 ff f0 	lis     r9,-16
    486c:	39 40 00 01 	li      r10,1
    4870:	61 29 40 00 	ori     r9,r9,16384
    4874:	90 69 00 00 	stw     r3,0(r9)
    4878:	91 49 00 10 	stw     r10,16(r9)
    487c:	4e 80 00 20 	blr
   */
}

#[link_section = ".rt"]
#[no_mangle]
pub unsafe extern "C" fn uart_read() -> u8 {
   while (core::ptr::read_volatile((UART_BASE + 0x00000008) as *const u32) != 0) {};
   let ch:u32 = core::ptr::read_volatile((UART_BASE + 0x00000000) as *const u32);
   core::ptr::write((UART_BASE + 0x00000010) as *mut u32, 2);
   return ch as u8;
   /*
   0000480c <uart_read>:
   480c:	3d 40 ff f0 	lis     r10,-16
   4810:	61 4a 40 08 	ori     r10,r10,16392
   4814:	81 2a 00 00 	lwz     r9,0(r10)
   4818:	2c 09 00 00 	cmpwi   r9,0
   481c:	40 82 ff f8 	bne     4814 <uart_read+0x8>
   4820:	3d 20 ff f0 	lis     r9,-16
   4824:	39 40 00 02 	li      r10,2
   4828:	61 29 40 00 	ori     r9,r9,16384
   482c:	80 69 00 00 	lwz     r3,0(r9)
   4830:	91 49 00 10 	stw     r10,16(r9)
   4834:	54 63 06 3e 	clrlwi  r3,r3,24
   4838:	4e 80 00 20 	blr
   */
}

#[link_section = ".rt"]
#[no_mangle]
pub unsafe extern "C" fn uart_read_nonblock() -> u8 {
   let ch:u32 = core::ptr::read_volatile((UART_BASE + 0x00000008) as *const u32);
   ch as u8
/*
0000483c <uart_read_nonblock>:
    483c:	3d 20 ff f0 	lis     r9,-16
    4840:	61 29 40 08 	ori     r9,r9,16392
    4844:	80 69 00 00 	lwz     r3,0(r9)
    4848:	7c 63 00 34 	cntlzw  r3,r3
    484c:	54 63 d9 7e 	rlwinm  r3,r3,27,5,31
    4850:	4e 80 00 20 	blr
     */

}

extern {
   pub fn printf(format: *const u8, ...) -> i32;
}

/* typecheck main
#[macro_export]
macro_rules! entry {
    ($path:path) => {
        #[export_name = "main"]
        pub unsafe fn __main() -> ! {
            // type check the given path
            let f: fn() -> ! = $path;

            f()
        }
    }
}
app code does:
use rt::entry;

entry!(main);

fn main() -> ! {
    let _x = 42;

    loop {}
}
*/

#[link_section = ".rt"]
#[no_mangle]
pub unsafe extern "C" fn Reset() -> ! {
   use core::ptr;
   extern "C" {
      static mut _sbss: u8;
      static mut _ebss: u8;

      static mut _sdata: u8;
      static mut _edata: u8;
      static _sidata: u8;

      static _stack_0: u8;
   }

   // even this brings in memset/memcpy; not on stack?
   let count = &_ebss as *const u8 as usize - &_sbss as *const u8 as usize;

   /* asm version, bss
   let start = &mut _sbss as *mut u8;
   let end = &mut _ebss as *mut u8;

         asm! {
            "subf. 16,{start},{end}",
            "beq   2f",
            "mtctr 16",
            "li    17,0",
            "addi  {start},{start},-1",
            "1:",
            "stbu  17,1({start})",
            "bdnz  1b",
            "2:",
            start = in(reg) start,
            end = in(reg) end
         }

   */

   ptr::write_bytes(&mut _sbss as *mut u8, 0, count);

   let count = &_edata as *const u8 as usize - &_sdata as *const u8 as usize;
   ptr::copy_nonoverlapping(&_sidata as *const u8, &mut _sdata as *mut u8, count);

   uart_sync();

   extern "Rust" {
      fn main() -> !;
   }

   main()
}
