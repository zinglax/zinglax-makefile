#                                             ,dPYb,                               
# =========================================== IP'`Yb ==============================
#              gg                             I8  8I                               
#              ""                             I8  8'                               
#     ,gggg,   gg    ,ggg,,ggg,     ,gggg,gg  I8 dP    ,gggg,gg     ,gg,   ,gg     
#    d8"  Yb   88   ,8" "8P" "8,   dP"  "Y8I  I8dP    dP"  "Y8I    d8""8b,dP"      
#   dP    dP   88   I8   8I   8I  i8'    ,8I  I8P    i8'    ,8I   dP   ,88"        
# ,dP  ,adP' _,88,_,dP   8I   Yb,,d8,   ,d8I ,d8b,_ ,d8,   ,d8b,,dP  ,dP"Y8,       
# 8"   ""Y8d88P""Y88P'   8I   `Y8P"Y8888P"8888P'"Y88P"Y8888P"`Y88"  dP"   "Y8      
#       ,d8I'                           ,d8I'                                      
#     ,dP'8I                          ,dP'8I        Whooohooo this is frigken      
#    ,8"  8I      Make it,           ,8"  8I               AWESOME!!!!!            
#     `Y8P"           like a boss     `Y8P"                                        
#  ,ggg, ,ggg,_,ggg,                                                               
# dP""Y8dP""Y88P""Y8b              ,dPYb,              ,dPYb,       ,dPYb,         
# Yb, `88'  `88'  `88              IP'`Yb              IP'`Yb       IP'`Yb         
#  `"  88    88    88              I8  8I              I8  8I  gg   I8  8I         
#      88    88    88              I8  8bgg,           I8  8'  ""   I8  8'         
#      88    88    88    ,gggg,gg  I8 dP" "8   ,ggg,   I8 dP   gg   I8 dP   ,ggg,  
#      88    88    88   dP"  "Y8I  I8d8bggP"  i8" "8i  I8dP    88   I8dP   i8" "8i 
#      88    88    88  i8'    ,8I  I8P' "Yb,  I8, ,8I  I8P     88   I8P    I8, ,8I 
#      88    88    Y8,,d8,   ,d8b,,d8    `Yb, `YbadP' ,d8b,_ _,88,_,d8b,_  `YbadP' 
#      88    88    `Y8P"Y8888P"`Y888P      Y8888P"Y888PI8"8888P""Y88P'"Y88888P"Y888
#                                                      I8 `8,                      
# ==================================================== I8  `8, ====================
#                                                      I8   8I                     
#  Zinglax's Make file for creating new Dev box setup  I8   8I                     
#                                                      I8, ,8'                     
#                                                       "Y8P'                      
# 
.PHONY: all update upgrade system ripgrep filesystem archives passwords fonts google-fonts themeing wallpapers python ansible virutalbox git vim nvim tmux js graphics media terminal-load tweak-tool office-tools screencasting vpn screenshare bash-extras wal 


all:
	@echo "Building Full Development Machine. ☃️   "
	make update
	make upgrade 
	make system 
	make ripgrep 
	make filesystem 
	make archives 
	make passwords 
	make fonts
	make google-fonts
	make themeing 
	make python 
	make wallpapers 
	#make wal 
	make ansible 
	make virutalbox 
	make git 
	make vim 
	make nvim 
	make tmux 
	make js 
	make graphics 
	make media 
	make terminal-load 
	make tweak-tool
	make office-tools
	make screencasting
	make screenshare 
	make vpn 
	make bash-extras
	make ios-debugging

update:
	sudo apt clean all
	sudo apt update

upgrade:
	sudo apt -y full-upgrade

system: 
	sudo apt install -y openssh-server
	sudo apt install -y cloc 
	sudo apt install -y tree 
	sudo apt install -y rabbitvcs-nautilus 
	sudo apt install -y curl 
	sudo apt install -y unzip 
	sudo apt install -y wget 
	sudo apt install -y traceroute 
	sudo apt install -y netcat 
	sudo apt install -y nmap 
	sudo apt install -y tcpdump 

ripgrep:
	wget -c https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb -O ./ripgrep.deb
	sudo apt install -y ./ripgrep.deb;
	rm ./ripgrep.deb

filesystem:
	mkdir -p ${HOME}/gits
	mkdir -p ${HOME}/envs
	mkdir -p ${HOME}/programs
	sh ./static/bash-append.sh ./static/filesystem.sh FILESYSTEM


archives:
	sudo apt install -y unrar
	sudo apt install -y rar
	sudo apt install -y zip

passwords:
	sudo apt install -y keepassxc

fonts:
	sudo apt-get install -y fonts-inconsolata
	sudo fc-cache -fv
	sudo apt-get install -y fonts-powerline

google-fonts:
	sh ./static/google-fonts_installer.sh

themeing: 
	# Change Scrollbars and highlights	
	sh ./static/ubuntu-18.04-theme.sh

wallpapers:
	mkdir -p ${HOME}/.local/share/gnome-background-properties/
	cp -r static/wallpapers/alena-aenami ${HOME}/Pictures/
	cp static/wallpapers/zinglax-wallpapers.xml ${HOME}/.local/share/gnome-background-properties/zinglax-wallpapers.xml
	
	# Replace file paths with the current home directory
	sed -i -e "s|/home/dylan|${HOME}|g" "${HOME}/Pictures/alena-aenami/alena-aenami-wallpaper.xml"
	sed -i -e "s|/home/dylan|${HOME}|g" "${HOME}/.local/share/gnome-background-properties/zinglax-wallpapers.xml"

wal:
	# Changing the whole theme of computer
	# Install Wal
	sudo --user=root -H pip3 install pywal
	
	# Copy wal-switcher to home	
	cp ./static/wal-switcher.sh ${HOME}/.wal-switcher.sh
	
	# Added wal persist to bash
	sh ./static/bash-append.sh ./static/wal-theme.sh WAL-THEME	

python:
	# Python2 
	# sudo apt -y install python-pip
	# sudo pip install virtualenv
	
	# Python3
	sudo apt -y install python3-pip
	sudo pip3 install virtualenv
	
	# Virtual ENV tips	
	sh ./static/bash-append.sh ./static/virtenv.sh VIRTENV 

ansible:
	sudo add-apt-repository -y ppa:ansible/ansible
	sudo apt install -y ansible

virtualbox:
	sudo apt -y install virtualbox-modules
	sudo apt -y install virtualbox-guest-utils
	sudo apt -y install virtualbox-guest-additions-iso
	sudo apt -y install virtualbox
	sudo apt -y install virtualbox-guest-dkms

git:
	sudo apt install -y git 
	sh ./static/bash-append.sh ./static/git-info.sh gitinfo

vim:
	sudo apt install -y vim-gtk
	cp ./static/vimrc ~/.vimrc
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall
	
	# Make VIM the default editor of git
	sh ./static/vim-git.sh

nvim: ripgrep
	# Download a copy of NeoVim appimage to ~/programs
	curl -fLo ${HOME}/programs/nvim.appimage  https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
	
	# Symlink to User Binaries. 
	sudo ln -fs ${HOME}/programs/nvim.appimage /usr/bin/nvim
	sudo ln -fs ${HOME}/programs/nvim.appimage /opt/nvim
	
	# Run the install script, links nvim config files.
	cd nvim && sh ./install.sh && cd ..
	
	# Download Vim-Plug Plugin Manager Plugin ;-) 
	whoami
	sh -c 'curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	
	# Install Plugins.
	nvim +PluginInstall +qall
	
	# Install CoC Language Plugins
	nvim "+CocInstall coc-tsserver coc-json coc-html coc-css coc-python coc-yaml"
	
	# Make NeoVim the default editor of git
	sh ./nvim/nvim-git.sh
	
	# Install Powerline Fonts
	sudo apt-get install -y fonts-powerline

tmux: 
	sudo apt install -y tmux 
	cp ./static/tmux.conf ${HOME}/.tmux.conf
	sh ./static/bash-append.sh ./static/auto-tmux.sh AUTO-TMUX 
	
	# tmuxp for saving and loading sessions
	sudo pip install tmuxp 
	mkdir -p ${HOME}/.tmuxp/layouts

js:
	# NodeJS
	sudo apt install -y nodejs
	
	# NodeJS Package Manager
	nodejs -v
	sudo apt install -y npm
	
	# eslint ( JavaScript Linter ) 
	sudo npm install -g eslint 
	mkdir -p ${HOME}/.eslint/conf
	cp ./static/eslint.*.conf.json ${HOME}/.eslint/conf/
	sh ./static/bash-append.sh ./static/eslint-helpers.sh ESLINT-HELPERS 
	
	# Install NVM
	sudo apt install -y build-essential checkinstall libssl-dev	
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh | bash
	nvm install latest
	nvm alias default node	

graphics:
	# Gimp
	sudo apt-get autoremove gimp gimp-plugin-registry
	sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
	sudo apt update
	sudo apt install -y gimp
	
	# Inkscape
	sudo add-apt-repository -y ppa:inkscape.dev/stable
	sudo apt update
	sudo apt install -y inkscape

media: 
	sudo apt install -y ubuntu-restricted-extras
	sudo apt install -y libxvidcore4
	
	# VLC Media Player 
	sudo apt install -y vlc
	
	# GStreamer
	sudo apt install -y gstreamer1.0-plugins-base
	sudo apt install -y gstreamer1.0-plugins-good
	sudo apt install -y gstreamer1.0-plugins-ugly
	sudo apt install -y gstreamer1.0-plugins-bad
	sudo apt install -y gstreamer1.0-alsa
	sudo apt install -y gstreamer1.0-fluendo-mp3
	sudo apt install -y gstreamer1.0-libav
	
	# Pulse Audio Volume Control
	sudo apt install -y pavucontrol
	
	# Blender
	sudo apt install -y blender
	
	# OBS Studio 
	sudo apt-get install -y xserver-xorg-input-all
	sudo add-apt-repository ppa:obsproject/obs-studio -y
	sudo apt-get update
	sudo apt-get install obs-studio -y

terminal-backup:
	# Make a backup of the current terminal themes
	dconf dump /org/gnome/terminal/ > static/gnome_terminal_settings_backup.txt

terminal-load:
	# Load a backup of terminal themes
	dconf load /org/gnome/terminal/ < static/gnome_terminal_settings_backup.txt

tweak-tool: 
	# Install the Ubuntu Tweak tool
	sudo add-apt-repository universe
	sudo apt install -y gnome-tweak-tool

office-tools:
	sudo apt install -y freeplane

screenshare:
	sudo snap install remmina

screencasting:
	# Simple Screen Recorder
	sudo apt install -y simplescreenrecorder
	
	## Open Broadcaster Software Studio 
	# sudo add-apt-repository ppa:obsproject/obs-studio
	# sudo apt update
	# sudo apt install obs-studio
	
	## Kazam
	# sudo apt install kazam

vpn:
	sudo apt install -y network-manager-openvpn 
	sudo apt install -y network-manager-openvpn-gnome

system76:
	# Run this target for System76 Machines (*Not included in overall make target) 
	sudo apt-add-repository -ys ppa:system76-dev/stable
	sudo apt update
	sudo apt install -y system76-driver

bash-extras:
	sh ./static/bash-append.sh ./static/searching-functions.sh SEARCHING-FUNCTIONS 
	sh ./static/bash-append.sh ./static/selected-editor.sh SELECTED-EDITOR 
	sh ./static/bash-append.sh ./static/directory-swaping-functions.sh DIRECTORY-SWAPING-ALIAS 

ios-debugging:
	sudo apt install -y autoconf automake autoconf libtool pkg-config gcc 
	
	# Install libplist 
	cd ${HOME}/gits; \
	wget -c https://github.com/libimobiledevice/libplist/archive/2.1.0.tar.gz -O - | tar -xz; \
	cd libplist-2.1.0; \
	./autogen.sh; \
	make; \
	sudo make install;
	
	# Install usbmuxd 
	cd ${HOME}/gits; \
	git clone https://github.com/libimobiledevice/usbmuxd.git; \
	cd usbmuxd; \
	./autogen.sh; \
	make; \
	sudo make install;
	
	# Install libimobiledevice
	cd ${HOME}/gits; \
	git clone https://github.com/libimobiledevice/libimobiledevice.git; \
	cd libimobiledevice; \
	./autogen.sh; \
	make; \
	sudo make install; \
	
	# Install libusbmuxd 
	cd ${HOME}/gits; \
	git clone https://github.com/libimobiledevice/libusbmuxd.git; \
	cd libusbmuxd; \
	./autogen.sh; \
	make; \
	sudo make install;
	
	# Install iOS WebKit Debug Proxy.
	cd ${HOME}/gits; \
	wget -c https://github.com/google/ios-webkit-debug-proxy/archive/v1.8.6.tar.gz -O - | tar -xz; \
	cd ios-webkit-debug-proxy-1.8.6; \
	./autogen.sh; \
	make; \
	sudo make install
	
	# Install remote debug adapter.	
	sudo npm install remotedebug-ios-webkit-adapter -g

	# In order to debug off iOS
	# On the device Enable Safari Web Inspector
	# * iOS Settings => Safari preferences => enable "Web Inspector"	
	# In chrome devtools configure the localhost server
	# * chrome://inspect/#devices => Configure => Target Discovery Settings add localhost:<port> ( default port is 9000 )
	# Via the command line start usbmuxd
	# * sudo usbmuxd -vv -f
	# Also Via command line start the remotedebug_ios_webkit_adapter
	# * remotedebug_ios_webkit_adapter -p 9000
	# Plug the device into the computer and Trust this computer
	# A gray window on ubuntu should also appear saying its waiting to trust the device
	#
