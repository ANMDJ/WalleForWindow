# WalleForWindow
1.配置环境变量：配置 buildToolsVersion对应版本号
	例如 buildToolsVersion "29.0.3" 环境变量 C:\Android\android_sdk\build-tools\29.0.3
2.将签名文件访问此文件夹内。
3.更改打包参数
	用文本编辑器打开wallebat.bat文件,替换签名参数
	例：
	CALL apksigner sign --ks （密钥库名） --ks-key-alias (密钥别名) --ks-pass pass:(KeyStore密码) --key-pass pass:(签署者的密码) --out app_signed.apk app_aligned.apk

	CALL apksigner sign --ks my_key.jks --ks-key-alias myapp --ks-pass pass:kspassword --key-pass pass:keypassword --out app_signed.apk app_aligned.apk
4.更改渠道文件
	用文本编辑器打开channel文件，编辑渠道

开始打包
从360加固获取 加固后的未签名安装包 更名为 app_enc.apk,双击 wallebat.bat 开始打包
