;;! target = "riscv64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-maximum-size=0 -O static-memory-guard-size=0 -O dynamic-memory-guard-size=0"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; wasm[0]::function[0]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       slli    a5, a2, 0x20
;;       srli    a1, a5, 0x20
;;       auipc   a2, 0
;;       ld      a2, 0x50(a2)
;;       add     a2, a1, a2
;;       bgeu    a2, a1, 8
;;       .byte   0x00, 0x00, 0x00, 0x00
;;       ld      a4, 0x68(a0)
;;       ld      a5, 0x60(a0)
;;       sltu    a2, a4, a2
;;       add     a1, a5, a1
;;       lui     a0, 0xffff
;;       slli    a4, a0, 4
;;       add     a1, a1, a4
;;       neg     a5, a2
;;       not     a2, a5
;;       and     a4, a1, a2
;;       sb      a3, 0(a4)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
;;       .byte   0x01, 0x00, 0xff, 0xff
;;       .byte   0x00, 0x00, 0x00, 0x00
;;
;; wasm[0]::function[1]:
;;       addi    sp, sp, -0x10
;;       sd      ra, 8(sp)
;;       sd      s0, 0(sp)
;;       mv      s0, sp
;;       slli    a5, a2, 0x20
;;       srli    a1, a5, 0x20
;;       auipc   a2, 0
;;       ld      a2, 0x50(a2)
;;       add     a2, a1, a2
;;       bgeu    a2, a1, 8
;;       .byte   0x00, 0x00, 0x00, 0x00
;;       ld      a3, 0x68(a0)
;;       ld      a4, 0x60(a0)
;;       sltu    a2, a3, a2
;;       add     a1, a4, a1
;;       lui     a0, 0xffff
;;       slli    a3, a0, 4
;;       add     a1, a1, a3
;;       neg     a5, a2
;;       not     a2, a5
;;       and     a3, a1, a2
;;       lbu     a0, 0(a3)
;;       ld      ra, 8(sp)
;;       ld      s0, 0(sp)
;;       addi    sp, sp, 0x10
;;       ret
;;       .byte   0x01, 0x00, 0xff, 0xff
;;       .byte   0x00, 0x00, 0x00, 0x00
