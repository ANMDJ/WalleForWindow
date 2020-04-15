@echo on
echo 中国我爱你
::对齐 app_enc.apk加固未签名包 
zipalign -v 4 app_enc.apk app_aligned.apk
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto sign
:sign
echo success zipalign
::开始签名
CALL apksigner sign --ks 密钥库名 --ks-key-alias 密钥别名 --ks-pass pass:KeyStore密码 --key-pass pass:签署者的密码 --out app_signed.apk app_aligned.apk
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto verify
:verify
echo success sign
::校验签名
CALL apksigner verify -v --print-certs app_signed.apk
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto walle
:walle
echo success verify
::walle打包
CALL java -jar walle-cli-all.jar batch -f channel app_signed.apk
IF ERRORLEVEL 1 goto 1
IF ERRORLEVEL 0 goto over
:over
echo success walle
goto exit
:1
echo error
::程序执行完毕跳至标题exit处退出
goto exit
:exit
pause
