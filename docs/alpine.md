# alpine
<br>
`https://itsfoss.com/alpine-linux-virtualbox/`

`https://www.alpinelinux.org/downloads/`

`https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/alpine-virt-3.21.3-x86_64.iso`

`https://dl-cdn.alpinelinux.org/alpine/`

`https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/`

alpine-virt-3.21.3-x86_64

64 512 КБайт

`https://www.virtualbox.org/`

`https://www.virtualbox.org/wiki/Downloads`

`https://download.virtualbox.org/virtualbox/7.1.6/VirtualBox-7.1.6-167084-Win.exe`

`https://download.virtualbox.org/virtualbox/`

'https://download.virtualbox.org/virtualbox/7.1.6/'

VirtualBox-7.1.6-167084-Win

120 134 КБайт

Oracle_VirtualBox_Extension_Pack-7.1.6

22 435 КБайт

Версия 7.1.6r167084<br><br>

# VirtualBox
<br>
Создать

Имя: Alpine Linux

Диск: 25 ГБайт

Видеопамять: 128 МБайт
<br><br>
## Запустить
<br>
root

setup-alpine

us

us

workhost

Interface: Enter 3 раза

Password: 1

Timezone: Europe Moscow

Proxy: Enter 2 раза

APK Mirror: f

User: alex

Full name: Enter

Password: 1

ssh: Enter 2 раза

Disk: ?

sda

sys

y

poweroff
<br><br>
## Изъять диск из виртуального привода
<br>
apk add nano

groups alex

`adduser <your-username> wheel`

cat /etc/doas.d/doas.conf

permit persist :wheel

`nano /etc/doas.d/doas.conf`

По умолчанию в Alpine Linux не включён репозиторий сообщества. Но он вам понадобится для установки дополнительных пакетов.

Поэтому отредактируйте файл репозиториев с помощью


nano /etc/apk/repositories

```txt
#/media/cdrom/apks
http://mirror.hyperdedic.ru/alpinelinux/v3.21/main
#http://mirror.hyperdedic.ru/alpinelinux/v3.21/community
```

надо убрать комментарий с нижней строки

(т.е. убрать #) и будет так
```txt
#/media/cdrom/apks
http://mirror.hyperdedic.ru/alpinelinux/v3.21/main
http://mirror.hyperdedic.ru/alpinelinux/v3.21/community
```

cat /etc/apk/repositories
<br><br>
## setup-xorg-base
<br>

apk add xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter dbus

rc-service dbus start

rc-update add dbus

setup-devd udev

rc-service lightdm start

...

rc-update add lightdm

apk add elogind polkit-elogind

reboot
<br><br>
# apk update
<br>
apk add virtualbox-guest-additions virtualbox-guest-additions-x11
