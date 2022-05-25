#!/bin/bash
#93 -> amarelo
#92 -> verde
if [ "$1" == "" ]
then
        echo -e "\e[93mSimple Parsing HTML Tool with DNS Resolver by \e[92mDTBrowser\e[93m"
        echo -e "Usage: $0 website"
        echo -e "Example: $0 example.com\e[0m"
else
        wget $1 -O /var/tmp/index.html 2> /dev/null
        subdominios=$(cat /var/tmp/index.html | grep -a "href=" | cut -d '"' -f2 | grep "/" | cut -d "/" -f3)
        echo -e "\e[92m<FOUND SUBDOMAINS>\n"
        echo -e "$subdominios\n"
        echo -e "\e[93m<FOUND IP Addresses>\n"
        for dominio in $(echo $subdominios);
        do
                echo -e "\e[92m$dominio\e[0m -> \e[93m" $(host $dominio | grep "has address" | cut -d " " -f4)
        done
fi
