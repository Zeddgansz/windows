function netmask() {
n="${1:-32}"
b=""
m=""
for((i=0;i<32;i++)){
[ $i -lt $n ] && b="${b}1" || b="${b}0"
}
for((i=0;i<4;i++)){
s=`echo "$b"|cut -c$[$[$i*8]+1]-$[$[$i+1]*8]`
[ "$m" == "" ] && m="$((2#${s}))" || m="${m}.$((2#${s}))"
}
echo "$m"
}
interface=`ip route show | awk '/dev/ {print $5; exit}'`
iAddr=`ip addr show dev $interface |grep "inet.*" |head -n1 |grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/[0-9]\{1,2\}'`
IPv4=`echo ${iAddr} |cut -d'/' -f1`
MASK=`netmask $(echo ${iAddr} |cut -d'/' -f2)`
GATE=`ip route show default |grep "^default" |grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' |head -n1`
printf "\n  %-20s" "`echo \"[*] Please wait until this server is reboot.. \"`"
wget --no-check-certificate -qO- https://raw.githubusercontent.com/Zeddgansz/windows/main/inst.sh | bash -s - -n $IPv4,$MASK,$GATE -t https://gz.tafnix.com/bios/ws2016-nKm.vhd.gz -w adzanfauzan6@ > /dev/null
