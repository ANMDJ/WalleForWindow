@echo on
echo �й��Ұ���
::���� app_enc.apk�ӹ�δǩ���� 
zipalign -v 4 app_enc.apk app_aligned.apk
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto sign
:sign
echo success zipalign
::��ʼǩ��
CALL apksigner sign --ks ��Կ���� --ks-key-alias ��Կ���� --ks-pass pass:KeyStore���� --key-pass pass:ǩ���ߵ����� --out app_signed.apk app_aligned.apk
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto verify
:verify
echo success sign
::У��ǩ��
CALL apksigner verify -v --print-certs app_signed.apk
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto walle
:walle
echo success verify
::walle���
CALL java -jar walle-cli-all.jar batch -f channel app_signed.apk
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto over
:over
echo success walle
goto exit
:1
echo error
::����ִ�������������exit���˳�
goto exit
:exit
pause
