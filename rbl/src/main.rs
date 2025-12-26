//! RBL Executable

#![no_std]
#![no_main]
#![feature(global_asm)]
#![feature(asm)]
#![deny(warnings)]

#[macro_use]
mod serial;
mod clint;
mod trap;

use core::panic::PanicInfo;

#[no_mangle]
pub unsafe extern "C" fn boot_first_hart(hartid: usize, dtb: usize) -> ! {
    extern "C" {
        static mut sbss: u32;
        static mut ebss: u32;
    }
    r0::zero_bss(&mut sbss, &mut ebss);

    println!("Welcome to Rust Boot Loader!");

    // enter supervisor mode
    let entry: usize = 0x80400000;
    println!(
        "Going to supervisor mode: entry={:#x}, hartid={}, dtb={:#x}",
        entry, hartid, dtb
    );

    // delegate interrupts
    let interrupts = 1 << 1 | 1 << 5 | 1 << 9; // SSIP | STIP | SEIP
    asm!("csrw mideleg, {}", in(reg) interrupts, options(nomem, nostack));

    // delegate exceptions below:
    // instruction address misaligned
    // breakpoint
    // environment call from u-mode
    // instruction page fault
    // load page fault
    // store/amo page fault
    let exceptions = 1 << 0 | 1 << 3 | 1 << 8 | 1 << 12 | 1 << 13 | 1 << 15;
    asm!("csrw medeleg, {}", in(reg) exceptions, options(nomem, nostack));

    // MSIE | MTIE
    asm!("csrw mie, {}", in(reg) 1 << 3 | 1 << 7, options(nomem, nostack));

    let mut mstatus: usize;
    asm!("csrr {}, mstatus", out(reg) mstatus, options(nomem, nostack));
    mstatus &= !(1 << 13 | 1 << 14); // disable fs
    mstatus &= !(1 << 7); // no mpie
    mstatus |= 1 << 11; // mpp = s
    asm!("csrw mstatus, {}", in(reg) mstatus, options(nomem, nostack));

    // set supervisor entry point
    asm!("csrw mepc, {}", in(reg) entry, options(nomem, nostack));

    // clear satp
    asm!("csrw satp, zero", options(nomem, nostack));

    // enter supervisor mode
    // pass three args into a0-a2
    let mask: usize = 1;
    asm!("mret", in("x10") hartid, in("x11") dtb, in("x12") mask, options(nomem, nostack));
    unreachable!();
}

global_asm!(include_str!("trap.S"));
global_asm!(include_str!("boot.S"));

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    println!("\n{}", info);
    loop {}
}
