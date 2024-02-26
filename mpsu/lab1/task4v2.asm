.include "m328pdef.inc"

init:
	ldi r16, 0x48  ; �������
	mov r14, r16
	clr r16
	lds r15, 0x0248  ; ��������
	ldi r21, 0x09  ; �������
division:
	rol r14
	dec r21
	brne remainder  ; ������� ���� Z != 0
	sts 0x0348, r14
	sts 0x0349, r16
end:
	rjmp end
remainder:
	rol r16  ; � ������ �
	sub r16, r15
	brcc remainder2  ; ������� ���� � = 0
	add r16, r15
	clc  ; �������� �
	rjmp division
remainder2:
	sec
	rjmp division

; r14 - ������� � �������, r15 - ��������, r16 - �������
