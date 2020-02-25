DIR=${0%/*}
model=""

if [[ "$OSTYPE" == "darwin"* ]]; then
    adb=$DIR/platform-tools/macOS/adb
else
    adb=$DIR/platform-tools/Linux/adb
fi

echo
echo "这只是一个卸载一些日版垃圾应用的脚本"
echo
echo "步骤："
echo "1. 打开手机的开发者选项中的「USB 调试」，连接电脑"
echo "2. 取消所有的设备管理应用程序"
echo
echo "回车以继续…"

read

test_adb() {
	adb_test=$(${adb} devices)
	if [[ "${adb_test/devices/d}" == *"device"* ]]; then
		echo "设备连接成功…"
	else
		echo "设备连接失败，请在手机上开启并允许「USB 调试」，回车以重试"
		read
		test_adb
	fi
}

model=$(${adb} shell getprop ro.product.device)
version=$(${adb} shell getprop ro.build.version.sdk)
if [[ "$model" == "SO-02J" ]];then
    echo "已连接至 SO-02J"
    echo "回车以进行下一步…"
    read 
else
    if [[ "$model" == "F5321" ]];then
        echo "此手机为港版 XC，无需进行此操作"
        echo "回车以退出…"
        read 
        exit 0
    else
        if [[ "$model" == "" ]];then
            echo "未识别该手机型号，回车以退出…"
        else
            echo "该手机非 SO-02J"
            echo "请勿使用此脚本"
            echo "回车以退出…"
            read
            exit 0
        fi
    fi
fi


echo "正在卸载预装的用户应用"
sleep 2
adb uninstall com.amazon.mShop.android.shopping
adb uninstall com.sony.nfx.app.sfrc
adb uninstall com.sonymobile.sketch
adb uninstall com.nttdocomo.android.photocollection
adb uninstall com.mobileselect.somcprein
adb uninstall com.sonymobile.lifelog
adb uninstall jp.co.lawson.activity
adb uninstall com.felicanetworks.mfw.a.main
adb uninstall com.sonyericsson.androidapp.sehome
adb uninstall com.nttdocomo.android.dpoint
adb uninstall com.sonymobile.androidapp.cameraaddon.stickercreator
adb uninstall com.somc.so02j.manual
adb uninstall com.nttdocomo.android.toruca
adb uninstall com.instagram.android
adb uninstall jp.co.nttdocomo.dbook
adb uninstall com.nttdocomo.android.moneyrecord
adb uninstall com.rsupport.rs.activity.ntt
adb uninstall com.mcafee.vsm_android_dcm
adb uninstall com.nttdocomo.android.voicetranslation
adb uninstall jp.dmapnavi.navi02
adb uninstall com.twitter.android
adb uninstall jp.id_credit_sp.android
adb uninstall com.facebook.orca
adb uninstall com.scee.psxandroid
adb uninstall jp.co.mcdonalds.android
adb uninstall com.sony.drbd.reader.other.jp
adb uninstall com.nttdocomo.android.cloudstorageservice
adb uninstall com.felicanetworks.mfm.main
adb uninstall com.amazon.kindle

echo "正在删除 Docomo 软件及服务"
sleep 2
adb shell pm uninstall --user 0 com.nttdocomo.android.areamail
adb shell pm uninstall --user 0 com.sonyericsson.docomo.settings
adb shell pm uninstall --user 0 com.nttdocomo.android.apnsw
adb shell pm uninstall --user 0 com.nttdocomo.android.bugreport
adb shell pm uninstall --user 0 com.nttdocomo.android.atf
adb shell pm uninstall --user 0 jp.co.nttdocomo.bridgelauncher
adb shell pm uninstall --user 0 com.nttdocomo.android.anmane2
adb shell pm uninstall --user 0 com.nttdocomo.android.gs.utility_sha2
adb shell pm uninstall --user 0 com.sonymobile.docomoemoji.license
adb shell pm uninstall --user 0 com.nttdocomo.android.accountwipe
adb shell pm uninstall --user 0 com.nttdocomo.android.pf.dcmippushaggregator
adb shell pm uninstall --user 0 com.nttdocomo.android.pf.dcmwappush
adb shell pm uninstall --user 0 jp.co.omronsoft.android.decoemojimanager_docomo
adb shell pm uninstall --user 0 jp.co.nttdocomo.saigaiban
adb shell pm uninstall --user 0 com.nttdocomo.android.store
adb shell pm uninstall --user 0 com.nttdocomo.android.applicationmanager
adb shell pm uninstall --user 0 com.nttdocomo.android.accountauthenticator
adb shell pm uninstall --user 0 com.nttdocomo.android.cloudset
adb shell pm uninstall --user 0 com.nttdocomo.android.sdcardbackup
adb shell pm uninstall --user 0 com.nttdocomo.android.initialization
adb shell pm uninstall --user 0 com.nttdocomo.android.dhome
adb shell pm uninstall --user 0 jp.co.nttdocomo.lcsapp
adb shell pm uninstall --user 0 jp.co.nttdocomo.lcsappsub
adb shell pm uninstall --user 0 jp.co.nttdocomo.carriermail
adb shell pm uninstall --user 0 com.android.contacts
adb shell pm uninstall --user 0 com.nttdocomo.android.docomoset
adb shell pm uninstall --user 0 com.nttdocomo.android.felicaremotelock
adb shell pm uninstall --user 0 com.nttdocomo.android.idmanager
adb shell pm uninstall --user 0 com.nttdocomo.android.dmenu2
adb shell pm uninstall --user 0 com.nttdocomo.android.iconcier
adb shell pm uninstall --user 0 com.nttdocomo.android.iconcier_contents
adb shell pm uninstall --user 0 com.nttdocomo.android.mediaplayer
adb shell pm uninstall --user 0 com.nttdocomo.android.voiceeditor
adb shell pm uninstall --user 0 com.nttdocomo.android.remotelock
adb shell pm uninstall --user 0 com.nttdocomo.osaifu.tsmproxy
adb shell pm uninstall --user 0 com.nttdocomo.android.devicehelp
adb shell pm uninstall --user 0 com.android.dialer
adb shell pm uninstall --user 0 com.nttdocomo.android.wipe
adb shell pm uninstall --user 0 com.nttdocomo.android.schedulememo
adb shell pm uninstall --user 0 com.nttdocomo.android.screenlockservice
adb shell pm uninstall --user 0 com.nttdocomo.android.osv
adb shell pm uninstall --user 0 com.nttdocomo.android.phonemotion
adb shell pm uninstall --user 0 com.nttdocomo.android.tapandpay
adb shell pm uninstall --user 0 jp.co.nttdocomo.anshinmode
adb shell pm uninstall --user 0 com.nttdocomo.android.mascot
adb shell pm uninstall --user 0 com.nttdocomo.android.databackup
adb shell pm uninstall --user 0 com.nttdocomo.android.dcmvoicerecognition
# Docomo 的漏网之鱼
adb shell pm uninstall --user 0 com.nttdocomo.android.osv.res.overlay_305
adb shell pm uninstall --user 0 com.sonyericsson.android.servicemenu.product.res.overlay.docomo
adb shell pm uninstall --user 0 com.sonymobile.superstamina.docomo.res.overlay

echo "正在删除 Facebook 三件套"
sleep 2
# 删除 Facebook 三件套
adb shell pm uninstall --user 0 com.facebook.katana
adb shell pm uninstall --user 0 com.facebook.system
adb shell pm uninstall --user 0 com.facebook.appmanager

ehco "正在删除自带的垃圾文件管理器"
sleep 2
# 删除自带的垃圾文件管理器
adb shell pm uninstall --user 0 com.mobisystems.fileman

ehco "正在删除其它无用应用"
sleep 2
# 删除其它应用
adb shell pm uninstall --user 0 com.nextbit.app
adb shell pm uninstall --user 0 com.felicanetworks.mfm
adb shell pm uninstall --user 0 com.felicanetworks.mfs
adb shell pm uninstall --user 0 com.felicanetworks.mfw.a.boot
adb shell pm uninstall --user 0 com.felicanetworks.mfc
adb shell pm uninstall --user 0 com.ipg.gguide.dcm_app.android
adb shell pm uninstall --user 0 jp.co.fsi.fs1seg
adb shell pm uninstall --user 0 com.sonyericsson.home.res.overlay_305
echo "正在删除已停止服务的“What's New”"
sleep 2
# 已停止服务的“What's New”
adb shell pm uninstall --user 0 com.sonymobile.entrance

echo "删除完成"
echo "回车以退出"
read 
exit 0