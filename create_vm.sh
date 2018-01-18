#!/bin/bash
VMNAME=$1
VDI=$2 # change here

VBoxManage createvm --name $VMNAME --register && \
VBoxManage modifyvm $VMNAME \
    --description "An OpenWRT VM" \
    --ostype "Linux_64" \
    --memory "256" \
    --cpus "1" \
    --nic1 "intnet" \
    --nictype1 "82540EM" \
    --nic2 "nat" \
    --nictype2 "82540EM" \
    --natpf2 "ssh,tcp,,9922,,22" \
    --natpf2 "openc2x,tcp,,1188,,1188" \
    --natpf2 "luci,tcp,,9980,,80" && \
VBoxManage storagectl $VMNAME \
    --name "SATA Controller" \
    --add "sata" \
    --portcount "1" \
    --hostiocache "on" \
    --bootable "on" && \
VBoxManage storageattach $VMNAME \
    --storagectl "SATA Controller" \
    --port "1" \
    --type "hdd" \
    --nonrotational "on" \
    --medium $VDI

