#!/bin/bash
# Bash Menu Script Example

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

PS3='What do you want to do with the virtual hosts: '
options=("install apache2 for the first time" "reinstall apache2" 
"uninstall apache2 with the configuration files" "uninstall apache2 only"
"list" "add" "delete" "disable site" "enable site"
"enable authentication" "disable authentication" "Quit")
select opt in "${options[@]}"; do
	case $opt in
	"install apache2 for the first time")
		echo "installing ..."
		bash install.sh
		;;
	"reinstall apache2")
		echo "reinstalling ..."
		bash reinstall.sh
		;;
	"uninstall apache2 only")
		echo "uninstalling ..."
		bash uninstall.sh
		;;
	"uninstall apache2 with the configuration files")
		echo "uninstalling ..."
		bash uninstall_purge.sh
		;;
	"list")
		echo "List of all Vhosts"
		bash list.sh
		;;
	"add")
		echo "will try to add new host"
		bash add.sh
		;;
	"delete")
		echo "deleting virtual host ..."
		bash delete.sh
		;;
	"disable site")
		echo "disabling site of a virtual host"
		bash disableSite.sh
		;;
	"enable site")
		echo "enabling site of a virtual host"
		bash enableSite.sh
		;;
	"enable authentication")
		echo "enabling authentication of a virtual host"
		bash allowAccess.sh
		;;
	"disable authentication")
		echo "disabling authentication of a virtual host"
		bash disableAuth.sh
		;;
	"Quit")
		break
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done
