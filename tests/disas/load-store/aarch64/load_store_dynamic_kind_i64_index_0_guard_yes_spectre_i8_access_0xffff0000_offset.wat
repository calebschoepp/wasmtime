;;! target = "aarch64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -W memory64 -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; wasm[0]::function[0]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       mov     w13, #-0xffff
;;       adds    x13, x2, x13
;;       b.hs    #0x44
;;   14: ldr     x14, [x0, #0x68]
;;       ldr     x0, [x0, #0x60]
;;       mov     x15, #0
;;       add     x0, x0, x2
;;       mov     x1, #0xffff0000
;;       add     x0, x0, x1
;;       cmp     x13, x14
;;       csel    x15, x15, x0, hi
;;       csdb
;;       strb    w3, [x15]
;;       ldp     x29, x30, [sp], #0x10
;;       ret
;;   44: .byte   0x1f, 0xc1, 0x00, 0x00
;;
;; wasm[0]::function[1]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       mov     w13, #-0xffff
;;       adds    x13, x2, x13
;;       b.hs    #0xa4
;;   74: ldr     x14, [x0, #0x68]
;;       ldr     x0, [x0, #0x60]
;;       mov     x15, #0
;;       add     x0, x0, x2
;;       mov     x1, #0xffff0000
;;       add     x0, x0, x1
;;       cmp     x13, x14
;;       csel    x15, x15, x0, hi
;;       csdb
;;       ldrb    w0, [x15]
;;       ldp     x29, x30, [sp], #0x10
;;       ret
;;   a4: .byte   0x1f, 0xc1, 0x00, 0x00
