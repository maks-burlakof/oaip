.include "m328pdef.inc"

init:
	ldi r16, 0xAB  ; ������ � 0x0248, 0x0249
	ldi r17, 0xDC
	sts 0x0248, r16
	sts 0x0249, r17
	ldi r16, 0xFE  ; ������ � r14
	mov r14, r16
	clr r16
	clr r17
main:
	lds r19, 0x0248
	lds r18, 0x0249
	mul r18, r14  ; ��.�. �� r14
	sts 0x034A, r0
	mov r20, r1  ; ��.�.������������
	mul r19, r14  ; ��.�. �� r14
	add r0, r20  ; ��.�.������������ + ��.�.������������
	adc r1, r21  ; ��.�.������������ + ������ + ���� ������������
	sts 0x0348, r1
	sts 0x0349, r0
end:
	rjmp end
