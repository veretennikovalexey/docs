# KDE

https://cdimage.debian.org/debian-cd/current/amd64/bt-cd/debian-12.10.0-amd64-netinst.iso.torrent

Имя: kde

Пропустить автоматическую установку

Память: 1024 Мб

Процессоры: 2

Диск: 30 Гб

Готово

Настроить

Общие - Дополнительно - Общий буфер обмена - Двунаправленный

Дисплей - Видеопамять - 128 Мб

Включить 3D-ускорение

Сеть - Тип подключения - Сетевой мост

ОК

Запустить

Graphical install

English - English - Continue

other - Continue

Europe - Continue

Russian Federation - Continue

United States - en_US.UTF-8 - Continue

American English - Continue

Loading...

Hostname: ex

Root password: 1

Username: al

password: 1

Moscow+00 - Moscow

Guided - use entire disk

All files in one partition

Finish

Yes

Install the base system...

Scan extra - No

Russian Federation

deb.debian.org

Proxy - Continue

Configure the package manager...

Participate - No

Select and install software:

- Debian desktop environment

- KDE Plasma

- standard system utilites

...

Install the GRUB boot loader - Yes

/dev/sda

Finish the installation

reboot

# Открываем терминал

su

1

sudo apt install build-essential dkms linux-headers-$(uname -r)

cd /tmp

`http://download.virtualbox.org/virtualbox/`

`http://download.virtualbox.org/virtualbox/7.1.6/`

`http://download.virtualbox.org/virtualbox/7.1.6/VBoxGuestAdditions_7.1.6.iso`

wget http://download.virtualbox.org/virtualbox/7.1.6/VBoxGuestAdditions_7.1.6.iso

mount -o loop,ro VBoxGuestAdditions_7.1.6.iso /mnt

sh /mnt/VBoxLinuxAdditions.run

shutdown now








 
















