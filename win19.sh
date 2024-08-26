function netmask() {
    n="${1:-32}"
    b=""
    m=""
    for ((i=0; i<32; i++)); do
        [ $i -lt $n ] && b="${b}1" || b="${b}0"
    done
    for ((i=0; i<4; i++)); do
        s=$(echo "$b" | cut -c$((i*8+1))-$(( (i+1)*8 )))
        [ "$m" == "" ] && m="$((2#${s}))" || m="${m}.$((2#${s}))"
    done
    echo "$m"
}

# Mendapatkan nama interface jaringan utama
interface=$(ip route show | awk '/dev/ {print $5; exit}')

# Mendapatkan alamat IP dan CIDR prefix
iAddr=$(ip addr show dev "$interface" | grep "inet " | head -n1 | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/[0-9]\{1,2\}')

# Memisahkan IPv4 dan Mask
IPv4=$(echo "$iAddr" | cut -d'/' -f1)
MASK=$(netmask $(echo "$iAddr" | cut -d'/' -f2))

# Mendapatkan alamat Gateway
GATE=$(ip route show default | grep "^default" | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' | head -n1)

# Menampilkan pesan sebelum reboot
printf "\n  %-20s\n" "[*] Please wait until this server is reboot..."

# Mendownload dan mengeksekusi script dari URL
wget --no-check-certificate -qO- https://github.com/minlearn/1keydd/raw/master/inst.sh | bash -s - -n "$IPv4,$MASK,$GATE" -t http://128.199.226.125/windows2022.gz > /dev/null
