#! /bin/bash
if [ ! -d "$HOME/Documents/cdesktopenv-code" ]
then
	echo -e "\033[38;5;159mInstalling dependencies\033[0m\n"
	sudo apt install autoconf automake libtool git build-essential g++ 	lib{xt,xmu,xft,xinerama,xpm,pam,motif,ssl,xaw7,x11,xss,tirpc,jpeg,freetype6,utempter}-dev tcl-dev ksh m4 ncompress xfonts-{100,75}dpi{,-transcoded} rpcbind bison patch xbitmaps x11proto-fonts-dev flex
	cd $HOME/Documents/
	echo -e "\033[4;38;5;178mCloning the CDE repo\033[0m\n"
	echo -e "";
	git clone https://git.code.sf.net/p/cdesktopenv/code cdesktopenv-code
	cd $HOME/Documents/cdesktopenv-code/cde/
	echo -e "\033[1;3;38;5;165mRunning autogeneration, configuration, and installation\033[0m\n"
	./autogen.sh
	./configure
	make
	sudo make install
	echo -e "\033[38;5;150mCopying the session.desktop file to Xsession for login under GDM,LIGHTDM, etc.\033[0m\n"
	sudo cp -v $HOME/Documents/cdesktopenv-code/cde/contrib/desktopentry/cde.desktop /usr/share/xsessions/cde2.desktop
	echo -e "\033[38;5;180mCommon Desktop Environment (CDE) complete! Exiting script\033[0m\n"
	exit
else
	echo -e "\033[1;38;5;160mDirectory already exists!\nExiting script!\033[0m"
	exit
fi
