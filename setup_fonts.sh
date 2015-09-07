#!/bin/bash

if [  -d /tmp/powerlin_fonts  ]
   then 
        echo -e "\e[32m------------------------------"
        echo -e "/tmp/powerlin_fonts already exists."
        echo -e " Deleting it."
        echo -e "------------------------------\e[39m"
        echo
        rm -r /tmp/powerlin_fonts
fi


echo -e "\e[32m------------------------------"
echo -e "Downloading fonts to ~/tmp/powerlin_fonts/"
echo -e "------------------------------\e[39m"
echo
wget -P /tmp/powerlin_fonts https://github.com/powerline/fonts/archive/master.zip


echo -e "\e[32m------------------------------"
echo -e "Unzip"
echo -e "------------------------------\e[39m"
echo
unzip /tmp/powerlin_fonts/master.zip -d /tmp/powerlin_fonts/

echo -e "\e[32m------------------------------"
echo -e "Installing fonts to ~/.fonts"
echo -e "------------------------------\e[39m"
echo
/tmp/powerlin_fonts/fonts-master/install.sh


echo -e "\e[32m------------------------------"
echo -e "Clean Up."
echo -e "------------------------------\e[39m"
echo
rm -r /tmp/powerlin_fonts
