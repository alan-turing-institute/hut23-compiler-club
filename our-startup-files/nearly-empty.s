	.arch armv7e-m		
	.syntax unified	
	.thumb	
	
	/* This script has no code.
	   It has five bytes of data in each section.
	   Each string is labelled, otherwise the linker will
	   discard the section.
	*/	

	/* The .vectors section (normally for vector table) */
	.section 	.vectors
vect: 	.asciz		"vect"

	/* The .text section (normally for code) */
	.text
text:	.asciz		"text"

	/* The .rodata section (normally for read-only data) */
	.section 	.rodata
rodt:	.asciz 		"rodt"

	/* The .data section (normally for data) */
	.data
data:	.asciz 		"data"
	
	/* The .bss section (normally for initially-zero data) */
	/* No actual data can be stored here */
	.bss
zero:	.skip		5
