    .file	"kernel_loop.c"
    .text
    .align	2
    .global	kernel_enter_loop
    .type	kernel_enter_loop, %function
kernel_enter_loop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0

	stmfd	sp!, {r4-r12, lr}

    .global	kernel_to_task
    .type	kernel_to_task, %function
kernel_to_task:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0

    ldmfd   r0!, {r4, lr}
    msr     spsr, r4

    msr  	cpsr_c, #0xdf
    mov	    sp, r0
    ldmfd	sp!, {r0-r12, lr}

    msr  	cpsr_c, #0xd3
    movs	pc, lr

    .size	kernel_to_task, .-kernel_to_task
    .align	2
    .global	swi_handler
    .type	swi_handler, %function
swi_handler:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0


    msr     cpsr_c, #0xdf
    stmfd   sp!, {r1-r12, lr}
    mov     r4, sp
    
    msr     cpsr_c, #0xd3
    mov     r6, lr
    bl      handle_sys_call
    stmfd   r4!, {r0}
    mrs     r5, spsr
    stmfd   r4!, {r5, r6}
    mov     r0, r4
    bl      k_schedule

    cmp     r0, #0
    bne     kernel_to_task

    .size	swi_handler, .-swi_handler
kernel_to_redboot:

	ldmfd	sp!, {r4-r12, lr}
    bx lr

	.ident	"GCC: (GNU) 4.0.2"
