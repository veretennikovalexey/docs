# vagrant *vpn*
<br>
VirtualBox-7.1.8-168469-Win.exe

Oracle_VirtualBox_Extension_Pack-7.1.8.vbox-extpack

*https://releases.hashicorp.com/vagrant/2.4.3/vagrant_2.4.3_windows_amd64.msi*

https://shanemcd.org/2018/12/14/setting-up-a-debian-vagrant-box-on-windows-10-with-virtualbox

mkdir vagrant; cd vagrant

vagrant init debian/bookworm64

*vagrant up*

vagrant ssh

sudo apt-get update

sudo apt-get upgrade

sudo apt-get dist-upgrade

sudo apt-get autoremove

logout

vagrant plugin install vagrant-vbguest

vagrant halt
<br><br>
# Vagrantfile
<br>
`config.vm.synced_folder ".", "/vagrant", type: "virtualbox"`

vagrant up

vagrant ssh

sudo apt install build-essential dkms linux-headers-$(uname -r)

cd /tmp

wget http://download.virtualbox.org/virtualbox/7.1.8/VBoxGuestAdditions_7.1.8.iso

sudo mount -o loop,ro VBoxGuestAdditions_7.1.8.iso /mnt

sudo sh /mnt/VBoxLinuxAdditions.run

sudo tasksel install xfce-desktop

logout

vagrant halt

```
config.vm.provider "virtualbox" do |vb|
  vb.gui = true
  vb.memory = "2048"
  vb.customize ["modifyvm", :id, "--vram", "32"]
end
```