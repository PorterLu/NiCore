/*
 * NiCore has no compressed instructions. The four compressed loads and stores
 * of tinst_tests.c are assembled as their 32-bit forms.
 */
#ifndef __ASSEMBLER__
__asm__(".macro c.lw rd, mem\n\tlw \\rd, \\mem\n.endm\n"
	".macro c.ld rd, mem\n\tld \\rd, \\mem\n.endm\n"
	".macro c.sw rs, mem\n\tsw \\rs, \\mem\n.endm\n"
	".macro c.sd rs, mem\n\tsd \\rs, \\mem\n.endm\n");
#endif
