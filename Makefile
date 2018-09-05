

.PHONY: all update upgrade


all:
	@echo "Building Full Development Machine. ☃️   "
	make


update:
	sudo apt clean all
	sudo apt update

upgrade:
	sudo apt -y full-upgrade

fonts:
	sudo apt-get install fonts-inconsolata -y
	sudo fc-cache -fv        

themeing: 
	# Change Scrollbars and highlights	
	sh ./static/ubuntu-18.04-theme.sh
 
ansible:
	sudo apt install ansible

virtualbox:
	sudo apt install virtualbox
       
vim:
	sudo apt install vim
	cp ./static/vimrc ~/.vimrc	

tmux: 
	sudo apt install tmux 
	cp ./static/tmux.conf ~/.tmux.conf


