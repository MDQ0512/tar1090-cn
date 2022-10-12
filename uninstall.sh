#!/bin/bash

instance=tar1090
echo --------------
if [[ -n $1 ]]; then
	instance="tar1090-$1"
    rm -rf "/usr/local/share/tar1090/html-$1"
    echo "移除 tar1090 中,实例名称为 $instance!"
else
    echo "移除 tar1090 所有实例!"
	rm -rf /usr/local/share/tar1090
    rm -f /etc/lighttpd/conf-available/*tar1090*
    rm -f /etc/lighttpd/conf-enabled/*tar1090*
fi
echo --------------

systemctl stop "$instance"
systemctl disable "$instance"

#rm -f /etc/default/$instance
echo "配置要手动删除，您可以使用此命令:"
echo "sudo rm /etc/default/$instance"
rm -f "/lib/systemd/system/$instance.service"

rm -f "/etc/lighttpd/conf-available/88-$instance.conf"
rm -f "/etc/lighttpd/conf-enabled/88-$instance.conf"
rm -f "/etc/lighttpd/conf-available/99-$instance-webroot.conf"
rm -f "/etc/lighttpd/conf-enabled/99-$instance-webroot.conf"


systemctl daemon-reload
systemctl restart lighttpd



echo --------------
echo "tar1090已经卸载!再见！"
