#!/bin/ash

SOURCE_PATH="$(cat /var/hxdata/.hxdir)"
test -d /root/hackme || mkdir /root/hackme
mount -t real -o exec -o suid "$SOURCE_PATH" /root/hackme
cd /root/hackme
make __hxfscompile
/root/hxpwn