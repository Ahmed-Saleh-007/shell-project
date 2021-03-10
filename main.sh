#!/bin/bash

# Bash Main Script for apache ITI shell project
# author Ahmed M. Saleh


# enable root access only
if [ "$EUID" -ne 0 ]
  then echo "Access Denied, Please run as root"
  exit
fi

# opening
echo ""
echo "================================================================================="
echo "=============================== Apache2 Control ================================="
echo "================================================================================="
echo ""

# ask user to get input
PS3='What do you want to do: '

# generate menu using option
options=(
	"install apache2"
	"reinstall apache2"
	"uninstall apache2 and remove conf files"
	"uninstall apache2 only"
	"show apache2 status"
	"list all Vhosts"
	"add"
	"delete"
	"disable site"
	"enable site"
	"enable authentication"
	"disable authentication"
	"quit"
)

select opt in "${options[@]}"; do
	case $opt in
	"install apache2")
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
	"uninstall apache2 and remove conf files")
		echo "uninstalling ..."
		bash uninstall_purge.sh
		;;
	"show apache2 status")
		echo "status ..."
		bash status.sh
		;;
	"list all Vhosts")
		echo "List of all Vhosts"
		bash Vhost-list.sh
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
	"quit")
		echo "bye"
		exit
		;;
	*)
		echo "invalid option $REPLY"
		;;
	esac
done
