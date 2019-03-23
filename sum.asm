;Author name: Molita Nuon
;Program title: Sum of Integers
;Files in this program: sum_driver.c, sum.asm, run.sh
;Course number: CPSC 240
;Assignment number: 2
;Required delivery date: Feb 18, 2019 before 11:59pm
;Purpose: Learn how to use loop and array
;Language of this module: X86 with Intel syntax
;Compile this module: nasm -f elf64 -l sum.lis -o sum.o sum.asm

extern printf
extern scanf
global sum

segment .data

initialmessage db "The fast accumulator program written in X86 Intel language has begun.", 10, 0
message db "Instructions: Enter a sequence of integers. Include white space between each number. To terminate press 'Enter' followed by Control+D", 10, 0
promptmessage db "Enter an integer: ",0
outmessage db "Thank you. You entered %i numbers with a sum equal to %i.", 10,0
goodbye db "The X86 function will now return the sum to the caller program. Bye.", 10, 0

integerformat db "%d", 0
stringformat db "%s", 0

segment .text

sum:

push       rbp                                              ;Save a copy of the stack base pointer
mov        rbp, rsp                                         ;We do this in order to be 100% compatible with C and C++.
push       rbx                                              ;Back up rbx
push       rcx                                              ;Back up rcx
push       rdx                                              ;Back up rdx
push       rsi                                              ;Back up rsi
push       rdi                                              ;Back up rdi
push       r8                                               ;Back up r8
push       r9                                               ;Back up r9
push       r10                                              ;Back up r10
push       r11                                              ;Back up r11
push       r12                                              ;Back up r12
push       r13                                              ;Back up r13
push       r14                                              ;Back up r14
push       r15                                              ;Back up r15
pushf

;welcome message
mov qword rax, 0
mov rdi, stringformat                     ;"%s"
mov rsi, initialmessage                   ;"The fast accumulator program...."
call printf

;print instuctions
push qword 0
mov rax, 0
mov rdi, stringformat                     ;"%s"
mov rsi, message                          ;"Instructions: Enter a sequence of integers..."
call printf
pop rax

mov r12, 0                                ; integer
mov r13, 0                                ;counter
mov r14, 0                                ;sum

startloop:

;ask for the integers
push qword 0
mov rax, 0
mov rdi, stringformat                      ;"%s"
mov rsi, promptmessage                     ;"Enter an integer:"
call printf
pop rax


;obtain integer
mov qword rax, 0
mov rdi, integerformat
mov rsi, rsp
call scanf

cdq                                     ;convert a double-word to quadword
shl rdx, 32                             ;shift left 32 place
or rax, rdx                             ;combine upper half of rdx with upper half
                                        ;of rax, leaving the answer in rax
cmp rax, -1                             ;see if control+D is push

je done                                 ;jump to done when control+D is push
pop r12                                 ;obtain the integer

add r14, r12                            ;add the integer to the sum in r14
inc r13                                 ;increase the counter
push r12                                ;restore r12

jmp startloop                           ;jump to the top of the loop
done:                                   ;end of the loop

;print result
mov rax, 0
mov rdi, outmessage                     ;"Thank you. You entered...."
mov rsi, r13                            ;number of integers
mov rdx, r14                            ;sum of the integers
call printf

;print goodbye
mov qword rax, 0
mov rdi, stringformat                    ;"%s"
mov rsi, goodbye                         ;"The X86 function will now return...."
call printf

mov rax, r14                             ;return the sum 

popf                                                        ;Restore rflags
pop        r15                                              ;Restore r15
pop        r14                                              ;Restore r14
pop        r13                                              ;Restore r13
pop        r12                                              ;Restore r12
pop        r11                                              ;Restore r11
pop        r10                                              ;Restore r10
pop        r9                                               ;Restore r9
pop        r8                                               ;Restore r8
pop        rdi                                              ;Restore rdi
pop        rsi                                              ;Restore rsi
pop        rdx                                              ;Restore rdx
pop        rcx                                              ;Restore rcx
pop        rbx                                              ;Restore rbx
pop        rbp                                              ;Restore rbp

ret
