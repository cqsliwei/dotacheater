;MASMPlus ����ģ�� - ʹ�ö�̬���ӿ�
;�������ģ����ʾ�� MASMPlus �Ķ๤�̷�ʽ,��һ���������붯̬�����
;��̬���ļ����Լ��ı���/��������,�����ļ��������������������.
;ģ��ÿ�������鶼����res��Դģ��,ʹ����Դ�༭���༭.����ʱ���Զ�����.
;ͬʱ,�������������ļ��붯̬���ļ�����������,����ģ��֮��ĸ�������Ų������.
;�����������ļ�,����������������ID,����Ĭ�����ļ����Ǳ����й����ļ�����
;����Ctrl����ĵ�ѡ������ѡ,�ٵ����Ҽ�,����������,�����������ڵ�����Ŀ�ϵ����Ҽ�

.386
.Model Flat, StdCall
Option Casemap :None

include windows.inc
include user32.inc
include kernel32.inc
include macro.asm

includelib kernel32.lib
includelib user32.lib

assume fs:nothing

.data?
	buf db 1000h dup(?)
.CODE
START:

invoke CreateFile, offset CTEXT("DLL.dll"),GENERIC_READ,FILE_SHARE_READ,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov esi, eax
invoke CreateFile, offset CTEXT("..\loader\console.exe"),GENERIC_WRITE,FILE_SHARE_READ,0,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
mov edi, eax
invoke SetFilePointer, esi, 400h,0,FILE_BEGIN
invoke SetFilePointer, edi, 800h,0,FILE_BEGIN
invoke ReadFile, esi, offset buf, 1000h,esp,0
invoke WriteFile, edi, offset buf, 1000h, esp, 0
invoke ExitProcess, 0

END START