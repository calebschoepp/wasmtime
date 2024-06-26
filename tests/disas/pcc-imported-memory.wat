;;! target = "x86_64"
;;! test = "compile"
;;! flags = [ "-Oopt-level=2", "-Cpcc=y" ]

(module
  (type (;0;) (func))
  (import "" "" (memory (;0;) 1))
  (func (;0;) (type 0)
    (local i32 i32)
    memory.size
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        memory.size
        i32.const 65536
        i32.mul
        i32.const 4
        local.get 0
        i32.add
        i32.le_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        local.get 0
        i32.load align=1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 1
    drop))

;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    0x58(%rdi), %r10
;;       movq    8(%r10), %rax
;;       movl    $0x10000, %r10d
;;       xorq    %rdx, %rdx
;;       divq    %r10
;;       movq    %rax, %r9
;;       shll    $0x10, %r9d
;;       leal    4(%rax), %r10d
;;       cmpl    %r10d, %r9d
;;       jbe     0x45
;;   2c: testl   %eax, %eax
;;       jle     0x45
;;   34: movq    0x58(%rdi), %rcx
;;       movq    (%rcx), %rcx
;;       movl    %eax, %edx
;;       movl    (%rcx, %rdx), %edi
;;       jmp     0x47
;;   45: xorl    %edi, %edi
;;       movq    %rbp, %rsp
;;       popq    %rbp
;;       retq
