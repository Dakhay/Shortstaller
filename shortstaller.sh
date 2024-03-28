#!/bin/bash 

if [ "$(id -u)" -eq 0 ]; then
    apt install nala -y 
    nala install exa gdb curl wget gdb docker docker-compose terminator bat nano iproute2 nmap snap cargo ruby python3 -y 
    nala update 
    nala upgrade -y 
 
    #BurpsSuite Install & Web Pentest 
    wget "https://portswigger.net/burp/releases/download?producta =community&version=2024.1.1.6&type=Linux" -O burpsuite_install.sh  
    chmod +x burpsuite_install.sh  
    ./burpsuite_install.sh  
    rm burpsuite_install.sh 
    
    #Metasploit & Seachsploit
    snap install searchsploit metasploit-framework




    #linPEAS & winPEAS
    cd ~ 
    mkdir linpeas
    cd linpeas
    curl -L https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh > linpeas.sh
    cd .. 
    mkdir winpeas 
    cd winpeas 
    wget -O winPEAS.ps1 https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/winPEAS/winPEASps1/winPEAS.ps1
    wget -O winPEAS.bat https://raw.githubusercontent.com/carlospolop/PEASS-ng/master/winPEAS/winPEASbat/winPEAS.bat 



    #wordlists
    cd ~
    mkdir wordlists
    cd wordlists 
    wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
    && unzip SecList.zip \
    && rm -f SecList.zip 
    wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
    gunzip rockyou.txt.gz
    rm -f rockyou.txt.gz



    #EZA Install
    wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
    chmod +x eza
    chown root:root eza
    mv eza /usr/local/bin/eza

    #tools Directory
    cd ~ 
    mkdir tools 
    cd tools 
    
    #GDB Install 
    git clone https://github.com/longld/peda.git ~/peda
    echo "source ~/peda/peda.py" >> ~/.gdbinit

    #impacket 
    git clone https://github.com/SecureAuthCorp/impacket.git
    cd impacket
    pip install . 
    cd .. 

    echo 'export PATH="$PATH:/root/tools/impacket/examples"' >> $HOME/.bashrc

    #Aliases building 
    echo "alias l='ls'" >> ~/.bash_aliases
    echo "alias ls='eza -lghu --icons --octal-permissions --hyperlink'" >> ~/.bash_aliases
    echo "alias la='ls -A'" >> ~/.bash_aliases
    echo "alias upd='sudo nala update'" >> ~/.bash_aliases 
    echo "alias upg='sudo nala upgrade'"  >> ~/.bash_aliases  
    echo "alias maj='upd && upg -y'" >> ~/.bash_aliases 
    echo "alias cl='clear'" >> ~/.bash_aliases
    echo "alias bat='batcat'" >> ~/.bash_aliases
    echo "alias cat='batcat'" >> ~/.bash_aliases
    echo "alias cping='ping google.fr'" >> ~/.bash_aliases

    source ~/.bash_aliases 

  #docker Initializing 
  docker pull ubuntu 
  docker pull debian

else
  echo "Run this script has root."
fi

