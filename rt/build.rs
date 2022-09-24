use std::{env, error::Error, fs::File, io::Write, path::PathBuf};

fn main() -> Result<(), Box<dyn Error>> {

    // build directory for this crate
    let out_dir = PathBuf::from(env::var_os("OUT_DIR").unwrap());

    // extend the library search path
    println!("cargo:rustc-link-search={}", out_dir.display());

    // put `linker.ld` in the build directory
    File::create(out_dir.join("linker.ld"))?.write_all(include_bytes!("linker.ld"))?;

    // put `defines.s` in the build directory
    //File::create(out_dir.join("defines.s"))?.write_all(include_bytes!("src/defines.s"))?;

    //println!("cargo:rustc-flags=-l c -L /data/projects/a2p-openpowerwtf/build/litex/full-litex/build/cmod7/software/libc");

    println!("cargo:rustc-flags=-l c -L {}/lib/picolibc", env!("CARGO_MANIFEST_DIR"));

    Ok(())
}