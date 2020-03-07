#!/bin/sh -e

echo

echo LICENSE-en=============
echo ubuntu-Android-studio-installer
echo Install Android studio on ubuntu with simple command.
echo
echo Copyright C 2020 Altair Linux team
echo
echo This program comes with ABSOLUTELY NO WARRANTY
echo This is free software, and you are welcome to redistribute it
echo under certain conditions.
echo See LICENSE.txt for details.
echo =======================
echo
echo   
echo ライセンス-ja============
echo ubuntu-Android-studio-installer 
echo Android studioをubuntuに簡単なコマンドでインストール
echo
echo Copyright C 2020 Altair Linux team
echo
echo このプログラムは*全くの無保証*で提供されます。これはフリーソフトウェアであり、ある条件の下で再頒布することが奨励されています。
echo 詳しくは LICENSE.txt を参照して下さい
echo =========================
echo
echo
echo    
echo -------=================
echo ubuntu Android studio installer 
echo ver.1.1
echo
echo After accepting the above license, enter your admin account password to continue.
echo 上記のライセンスに同意した上で続行するには管理アカウントのパスワードを入力してください
echo =================-------
sudo echo rootアクセスに成功しました。
echo adbをインストールします。
sudo apt install -y adb
echo adbをインストールしました。
echo その他必要なパッケージをインストールします。
sudo apt install -y \
     gcc-multilib g++-multilib libc6-dev-i386 qemu-kvm mesa-utils
echo 必要なパッケージのインストールが完了しました。

echo Android studio をダウンロードします
URL=https://dl.google.com/dl/android/studio/ide-zips/3.2.0.26
wget  ${URL}/android-studio-ide-181.5014246-linux.zip
echo ダウンロードしたファイルを展開しています
sudo unzip -q android-studio-ide-*linux.zip -d /opt/
rm -f android-studio-ide-*-linux.zip
echo デスクトップファイルを生成しています
sudo mkdir -p /usr/local/share/applications
cat <<EOF | sudo tee /usr/local/share/applications/android-studio.desktop
[Desktop Entry]
Type=Application
Name=Android Studio
Icon=/opt/android-studio/bin/studio.png
Exec=/opt/android-studio/bin/studio.sh
Terminal=false
Categories=Development;IDE;
EOF

echo kvmを設定しています
sudo gpasswd -a "${USER}" kvm
echo ===done!===
echo 完了しました。システムを再起動してください。

