#!/bin/bash
#Script auto create user SSH
#Adam M - 089639714655

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`curl icanhazip.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi SSH"
echo -e "=========-account-=========="
echo -e "Host: $IP"
echo -e "Port: 22, 143, 443, 109, 110"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "Config OpenVPN: $IP:81/1194-client.ovpn"
echo -e "-----------------------------"
echo -e "Aktif Sampai: $exp"
echo -e "==========================="
