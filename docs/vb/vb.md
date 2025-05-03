# vb.md

`https://www.virtualbox.org/wiki/Downloads`

`https://download.virtualbox.org/virtualbox/7.1.8/`

`https://download.virtualbox.org/virtualbox/7.1.8/VirtualBox-7.1.8-168469-Win.exe`

`VirtualBox-7.1.8-168469-Win.exe`

`https://download.virtualbox.org/virtualbox/7.1.8/Oracle_VirtualBox_Extension_Pack-7.1.8.vbox-extpack`

Oracle VirtualBox 7.1.8 needs the Microsoft Visual C++ 2019 Redistributable Package

`https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist`

`https://aka.ms/vs/17/release/vc_redist.x64.exe`

`ubuntu-25.04-desktop-amd64.iso.torrent`

# VBoxGuestAdditions

su

1

sudo apt install build-essential dkms linux-headers-$(uname -r) -y

cd /tmp

wget http://download.virtualbox.org/virtualbox/7.1.8/VBoxGuestAdditions_7.1.8.iso

mount -o loop,ro VBoxGuestAdditions_7.1.8.iso /mnt

sh /mnt/VBoxLinuxAdditions.run

sudo shutdown now