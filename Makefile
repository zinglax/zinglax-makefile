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
.PHONY: all update upgrade system filesystem archives passwords fonts themeing wallpapers python ansible virutalbox vim tmux graphics media terminal-load


all:
	@echo "Building Full Development Machine. ☃️   "
	make update
	make upgrade 
	make system 
	make filesystem 
	make archives 
	make passwords 
	make fonts 
	make themeing 
	make wallpapers 
	make python 
	make ansible 
	make virutalbox 
	make vim 
	make tmux 
	make graphics 
	make media 
	make terminal-load 


update:
	sudo apt clean all
	sudo apt update

upgrade:
	sudo apt -y full-upgrade

system: 
	sudo apt install -y openssh-server
	sudo apt install -y cloc 
	sudo apt install -y tree 
	sudo apt install -y git 
	sudo apt install -y rabbitvcs-nautilus 
	sudo apt install -y curl 
	sudo apt install -y wget 
	sudo apt install -y traceroute 
	sudo apt install -y netcat 
	sudo apt install -y nmap 
	sudo apt install -y tcpdump 

filesystem:
	mkdir -p ${HOME}/Gits
	mkdir -p ${HOME}/Envs

archives:
	sudo apt install -y unrar
	sudo apt install -y rar
	sudo apt install -y zip

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
	
	# Replace file paths with the current home directory
	sed -i -e "s|/home/dylan|${HOME}|g" "${HOME}/Pictures/alena-aenami/alena-aenami-wallpaper.xml"
	sed -i -e "s|/home/dylan|${HOME}|g" "${HOME}/.local/share/gnome-background-properties/zinglax-wallpapers.xml"

python:
	# Python2 
	sudo apt install python-pip
	sudo pip install virtualenv
	
	# Python3
	sudo apt install python3-pip


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



