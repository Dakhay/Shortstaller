#!/bin/bash 

if [ "$(id -u)" -eq 0 ]; then 
    apt install nala 
    nala install exa gdb curl wget gdb docker
    nala update 
    nala upgrade -y

    #EZA Install
    wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
    chmod +x eza
    chown root:root eza
    mv eza /usr/local/bin/eza

    #GDB Install 
    git clone https://github.com/longld/peda.git ~/peda
    echo "source ~/peda/peda.py" >> ~/.gdbinit


    #Aliases building 
    echo "alias l='ls'" >> ~/.bash_aliases
    echo "alias ls='ls -lghu --icons --octal-permissions --hyperlink'" >> ~/.bash_aliases
    echo "alias la='ls -A'" >> ~/.bash_aliases
    echo "alias upd='sudo nala update'" >> ~/.bash_aliases 
    echo "alias upg='sudo nala upgrade'"  >> ~/.bash_aliases  
    echo "alias maj='upd && upg -y'" >> ~/.bash_aliases 
    echo "alias cl='clear'" >> ~/.bash_aliases
    echo "alias cping='ping google.fr'"

    source ~/.bash_aliases


    


    

else
  echo "Run this script has root."
fi
