

.PHONY: all update upgrade


all:
	@echo "Building Full Development Machine. ☃️   "
	make


update:
	sudo apt clean all
	sudo apt update

upgrade:
	sudo apt -y full-upgrade

system: 
	sudo apt install -y openssh-server
	sudo apt install -y cloc 
	sudo apt install -y git 
	sudo apt install -y rabbitvcs-nautilus 
	sudo apt install -y curl 
	sudo apt install -y wget 
	sudo apt install -y tracereoute 

archives:
	sudo apt install -y unrar
	sudo apt install -y rar
	sudo apt install -y zip
	sudo apt install -y uzip

passwords:
	sudo apt install -y keepassxc

fonts:
	sudo apt-get install -y fonts-inconsolata
	sudo fc-cache -fv        

themeing: 
	# Change Scrollbars and highlights	
	sh ./static/ubuntu-18.04-theme.sh

wallpapers:
	mkdir -p ${HOME}/.local/share/gnome-background-properties/
	cp -r static/wallpapers/alena-aenami ${HOME}/Pictures/
	cp static/wallpapers/zinglax-wallpapers.xml ${HOME}/.local/share/gnome-background-properties/zinglax-wallpapers.xml


ansible:
	sudo add-apt-repository -y ppa:ansible/ansible
	sudo apt install -y ansible

virtualbox:
	sudo apt -y install virtualbox-modules
	sudo apt -y install virtualbox-guest-utils
	sudo apt -y install virtualbox-guest-additions-iso
	sudo apt -y install virtualbox
	sudo apt -y install virtualbox-guest-dkms

vim:
	sudo apt install -y vim
	cp ./static/vimrc ~/.vimrc
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall

tmux: 
	sudo apt install -y tmux 
	cp ./static/tmux.conf ~/.tmux.conf

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
	
	# Blender
	sudo apt install -y blender

media: 
	sudo apt install -y vlc
	sudo apt install -y ubuntu-restricted-extras
	sudo apt install -y libxvidcore4
	sudo apt install -y gstreamer1.0-plugins-base
	sudo apt install -y gstreamer1.0-plugins-good
	sudo apt install -y gstreamer1.0-plugins-ugly
	sudo apt install -y gstreamer1.0-plugins-bad
	sudo apt install -y gstreamer1.0-alsa
	sudo apt install -y gstreamer1.0-fluendo-mp3
	sudo apt install -y gstreamer1.0-libav

terminal-backup:
	# Make a backup of the current terminal themes
	dconf dump /org/gnome/terminal/ > static/gnome_terminal_settings_backup.txt

terminal-load:
	# Load a backup of terminal themes
	dconf load /org/gnome/terminal/ < static/gnome_terminal_settings_backup.txt



