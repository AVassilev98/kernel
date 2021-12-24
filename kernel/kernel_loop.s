    .file	"kernel_loop.c"
    .text
    .align	2
    .global	kernel_to_task
    .type	kernel_to_task, %function
kernel_to_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0

    msr  	cpsr_c, #0xdf
    mov	    sp, r0
    ldmfd	sp!, {r0-r12, lr}
    msr  	cpsr_c, #0xd3
    msr     cpsr, r12
    movs	pc, lr

    .size	kernel_to_task, .-kernel_to_task
    .align	2
    .global	swi_handler
    .type	swi_handler, %function
swi_handler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0


	mov     r12, lr
    msr     cpsr_c, #0xdf
    mov     lr, r12

    mrs     r12, cpsr
    stmfd   sp!, {r1-r12, lr}
    bl      handle_sys_call
    stmfd   sp!, {r0}

    mov     r0, sp
    msr     cpsr_c, #0xd3
    bl      k_schedule

    cmp     r0, #0
    bne     kernel_to_task

    .size	swi_handler, .-swi_handler
kernel_to_redboot:
    mov pc, lr

	.ident	"GCC: (GNU) 4.0.2"
