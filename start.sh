#!/bin/bash
# Update 28-03-2024
# Rizz

Green="\e[92;1m"
RED="\033[1;31m"
BG_RED="\033[41;97;1m" # BG MERAH
BG_BLUE="\\033[44;97;1m" # BG BIRU
CYAN="\033[96;1m"
NC='\033[0m'
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
Xark="\033[0m"
Orange='\033[0;33m'

##############################
buyer=$(wget -qO- https://rizz.pw/installer/user/adzan/adzan)
buyerexp=$(wget -qO- https://raw.githubusercontent.com/Zeddgansz/windows/main/tgl)
versi=$(wget -qO- https://rizz.pw/installer/versido)

##############################
today=`date -d "0 days" +"%Y-%m-%d"`
valid=$buyerexp

# // DAYS LEFT
d1=$(date -d "$valid" +%s)
d2=$(date -d "$today" +%s)
certifacate=$(((d1 - d2) / 86400))

if [[ $certifacate -gt 10000 ]]; then
    sisa="LIFETIME"
else
    sisa=$(echo -e "$certifacate Days")
fi
##############################
length=13
charset="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
str=""
Manufacturer=`dmidecode -t1 | grep Manufacturer | awk '{print $2}'`

if [[ "$Manufacturer" == "Linode" ]]; then
    prov="${green}LINODE${NC}"
elif [[ "$Manufacturer" == "DigitalOcean" ]]; then
    prov="${BLUE}DigitalOcean${NC}"
else
    prov="${red}UNKOWN${NC}"
fi

pass="adzanfauzan6@"

# Buat loop sebanyak jumlah karakter
for i in $(seq 1 $length); 
do
    # Ambil karakter random
    char=${charset:$(($RANDOM%${#charset})):1}
    
    # Tambahkan ke string
    str="$str$char"
done

##############################
clear
if [[ "$today" > "$valid" ]]; then
  echo -e "${BG_RED}        Script kadaluwarsa. Hubungi admin untuk memperbarui.${NC}"
  echo -e "${BG_RED}[ERROR] contact admin :                                     ${NC}"
  echo -e "${BG_RED}        Telegram: @zeddgans                ${NC}"
  exit 1  # Keluar dengan kode error 1
fi

while true; do
    clear
    echo -e "${green} ┌────────────────────────────────────────────┐ ${NC}"
    echo -e "${green} │${NC} ${YELLOW}Version         :${NC} ${red}$versi${NC}"
    echo -e "${green} │${NC} ${YELLOW}Creator         :${NC} ${red}zeddgans${NC}"
    echo -e "${green} │${NC} ${YELLOW}Client Name     :${NC} ${red}$buyer${NC}"
    echo -e "${green} │${NC} ${YELLOW}Provider        :${NC} $prov"
    echo -e "${green} │${NC} ${YELLOW}Expiry In       :${NC} ${red}$sisa${NC}"
    echo -e "${green} └────────────────────────────────────────────┘ ${NC}"
    echo -e "${red}┌────────────────────────┐${NC}"
    echo -e "${CYAN}  1) Windows 2012${NC}"
    echo -e "${CYAN}  2) Windows 2016${NC}"
    echo -e "${CYAN}  3) Windows 2019${NC}"
    echo -e "${CYAN}  4) Windows 2022${NC}"
    echo -e "${CYAN}  5) Windows 10${NC}"
    echo -e "${CYAN}  6) Windows 11${NC}"
    echo -e "${red}└────────────────────────┘${NC}"
    echo -e ""
    read -p "$(echo -e $YELLOW"Pilih (1-6): "$NC)" PILIHOS

    case "$PILIHOS" in
        1) PILIHOS="https://rizzcode.my.id/1:/W2012RizzNew.xz"  IFACE="Ethernet 3"  IFACEA="Ethernet 4"  OS="2012";;
        2) PILIHOS="https://rizzcode.my.id/1:/W2016Rizz.xz"  IFACE="Ethernet Instance 0"  IFACEA="Ethernet Instance 0 2"  OS="2016";;
        3) PILIHOS="https://rizzcode.my.id/1:/W2019Rizz.xz"  IFACE="Ethernet Instance 0"  IFACEA="Ethernet Instance 0 2"  OS="2019";;
        4) PILIHOS="https://rizzcode.my.id/1:/W2022Rizz.xz"  IFACE="Ethernet Instance 0"  IFACEA="Ethernet Instance 0 2"  OS="2022";;
        5) PILIHOS="https://rizzcode.my.id/1:/W10RizzNew.xz"  IFACE="Ethernet Instance 0"  IFACEA="Ethernet Instance 0 2"  OS="10";;
        6) PILIHOS="https://rizzcode.my.id/1:/W11RizzNew.xz"  IFACE="Ethernet Instance 0"  IFACEA="Ethernet Instance 0 2"  OS="11";;
        *) 
            echo -e "${YELLOW}Pilih (1-6): ${NC}"
            continue
            ;;
    esac

    if [[ "$Manufacturer" == "Linode" ]]; then
       echo -e ""
       echo -e "${BLUE}Provider Detected (${green}Linode${NC})${NC}"
       echo -e "${green}Your Provider Is Supported${NC}"
       echo -e "${YELLOW}Masukkan Linode API token:${NC}"
       read linodeapi
    elif [[ "$Manufacturer" == "DigitalOcean" ]]; then
       echo -e ""
       echo -e "${BLUE}Provider Detected (${green}DigitalOcean${NC})${NC}"
       echo -e "${green}Your Provider Is Supported${NC}"
       linodeapi=""
       sleep 2
       read -n 1 -s -r -p "Press any key to continue..."
    else
       echo -e ""
       echo -e "${BLUE}Provider Detected (${red}Unkown/Untested${NC})${NC}"
       # echo -e "${RED}Do With Your Own Risk/lakukan dengan resiko ditanggung sendiri${NC}"
       # read -n 1 -s -r -p "Press any key to continue..."
       echo -e "${red}Provider Tidak Tersedia, Jika ingin request${NC}"
       echo -e "${red}Contact Develop zeddgans${NC}"

    fi

    clear
    echo -e "${red}┌────────────────────────────────┐${NC}"
    echo -e "        ${BG_BLUE}Installing....${NC}"
    echo -e "${red}└────────────────────────────────┘${NC}"
    apt update >/dev/null 2>&1
    wget --no-check-certificate -qO RDP.sh 'rizz.1.hns.to//InstallNET.sh' && chmod a+x RDP.sh
    bash RDP.sh -windows $OS --pwin $pass --eth1 "'$IFACE'" --eth2 "'$IFACEA'" --insid $str --mmbr $buyer --apilinode $linodeapi
    break
done
