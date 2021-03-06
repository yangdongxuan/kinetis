/*******************************************************************************
*
* NOTE: THIS FILE IS TO BE CONSIDERED DEPRECATED.
        MOVING FORWARD USE SYSCALLS.C.
*
* libc_stubs.s
*
* Rob Laswick

* Work around for the required and undefined references in libc.a.
*
* These stubs/routines can be redefined and enhanced later as needed.
*
* Copyright (C) 2012 www.laswick.net
*
* This program is free software.  It comes without any warranty, to the extent
* permitted by applicable law.  You can redistribute it and/or modify it under
* the terms of the WTF Public License (WTFPL), Version 2, as published by
* Sam Hocevar.  See http://sam.zoy.org/wtfpl/COPYING for more details.
*
*******************************************************************************/
    .syntax unified
    .thumb

    .text

/*******************************************************************************
* exit
*******************************************************************************/
    .global _exit
    .weak   _exit
    .thumb_func
    .align 2
_exit:
    b _exit

/*******************************************************************************
* aeabi_uldivmod
*******************************************************************************/
    .global __aeabi_uldivmod
    .weak   __aeabi_uldivmod
    .thumb_func
    .align 2
__aeabi_uldivmod:
    b __aeabi_uldivmod

/*******************************************************************************
* sbrk_r
*
* Stack/Heap Collision Checker.
*
* For now cheat and simply return the end of the stack.
*******************************************************************************/
    .extern _stack_end
    .global _sbrk_r
    .weak   _sbrk_r
    .thumb_func
    .align 2
_sbrk_r:
    ldr r0, =_stack_end
    bx lr

    /* For older tools that dont support reent */
    .global _sbrk
    .weak   _sbrk
    .thumb_func
    .align 2
_sbrk:
    ldr r0, =_stack_end
    bx lr

/*******************************************************************************
* kill
*******************************************************************************/
    .global _kill
    .weak   _kill
    .thumb_func
    .align 2
_kill:
    b _kill

/*******************************************************************************
* getpid
*******************************************************************************/
    .global _getpid
    .weak   _getpid
    .thumb_func
    .align 2
_getpid:
    b _getpid

/*******************************************************************************
* write
*
* Redefined in uart.c
*******************************************************************************/
    .global _write
    .weak   _write
    .thumb_func
    .align 2
_write:
    b _write

/*******************************************************************************
* close
*******************************************************************************/
    .global _close
    .weak   _close
    .thumb_func
    .align 2
_close:
    b _close

/*******************************************************************************
* fstat
*
* Get the status of an open file.
*
* For now simply zero.
*******************************************************************************/
    .global _fstat
    .weak   _fstat
    .thumb_func
    .align 2
_fstat:
    ldr r0, =0
    bx lr

/*******************************************************************************
* isatty
*******************************************************************************/
    .global _isatty
    .weak   _isatty
    .thumb_func
    .align 2
_isatty:
    b _isatty

/*******************************************************************************
* lseek
*******************************************************************************/
    .global _lseek
    .weak   _lseek
    .thumb_func
    .align 2
_lseek:
    b _lseek

/*******************************************************************************
* read
*******************************************************************************/
    .global _read
    .weak   _read
    .thumb_func
    .align 2
_read:
    b _read

