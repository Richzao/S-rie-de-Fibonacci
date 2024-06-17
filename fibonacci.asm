    .data
num_30: .word 0
num_41: .word 0
num_40: .word 0
phi: .float 0.0

 .text
 .globl main

main:
    li $a0, 30
    jal fibonacci
    move $s1, $v0
    sw $v0, num_30

    li $a0, 41
    jal fibonacci
    move $s2, $v0
    sw $v0, num_41

    li $a0, 40
    jal fibonacci
    move $s3, $v0
    sw $v0, num_40

    lw $t0, num_41
    lw $t1, num_40
    mtc1 $t0, $f4
    mtc1 $t1, $f6
    cvt.s.w $f4, $f4
    cvt.s.w $f6, $f6
    div.s $f0, $f4, $f6
    s.s $f0, phi

    li $v0, 10
    syscall

fibonacci:
    li $t0, 0
    li $t1, 1

fibo_loop:
    beq $a0, 0, fibo
    beq $a0, 1, fibo

    add $t2, $t0, $t1
    move $t0, $t1
    move $t1, $t2
    sub $a0, $a0, 1
    j fibo_loop

fibo:
    move $v0, $t1
    jr $ra
