#[macro_use]
extern crate ruru;
extern crate libc;
use std::ffi::{CStr};
use std::str;
use ruru::*;
use ruru::types::*;

methods!(
    RString,
    itself,
    fn string_is_blank() -> Boolean {
        Boolean::new(itself.to_string().chars().all(|c| c.is_whitespace()))
    }
    );

#[no_mangle]
pub extern "C" fn init_blank() {
    Class::from_existing("String").define(|itself| {
        itself.def("blank?", string_is_blank);
    });
}

#[no_mangle]
pub extern fn is_blank(string: *const c_char) -> bool {
    let c_str = unsafe {
        if string.is_null() {
            return true;
        }
        CStr::from_ptr(string)
    };

    str::from_utf8(c_str.to_bytes()).unwrap().chars().all(|c| c.is_whitespace())
}
