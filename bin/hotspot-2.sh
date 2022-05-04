findWiredInterface() {
    ip addr | awk '/^[0-9][:]\senp/ {print substr($2, 1, length($2)-1)}'
}

findWirelessInterface() {
    ip addr | awk '/^[0-9][:]\swlp/ {print substr($2, 1, length($2)-1)}'
}

lengthOfString() {
    local string="$1"
    $string | awk '{print lenth}'
}

read -p "Enter hotspot name: " hotspotName
read -sp "Enter hotspot password: " hotspotPassword

PS3="Select a wireless interface: "

select interface in $(findWirelessInterface)
do
    sudo create_ap $interface $(findWiredInterface) $hotspotName $hotspotPassword
break
done

