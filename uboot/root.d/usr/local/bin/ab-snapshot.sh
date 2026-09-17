#!/usr/bin/bash

set -e

errf() { printf "$@\n" >&2; exit 1; }

(( EUID == 0 )) || errf "need root priviledge"

case "$1" in
    ab)
        srcname=a
        dstname=b
        ;;
    ba)
        srcname=b
        dstname=a
        ;;
    *)
        errf "Usage: $(basename $0) <ab|ba>"
        ;;
esac

dstmnt_alert="==> abort: you are running under '@${dstname}' subvolume now"
findmnt /${srcname} &>/dev/null && errf "$dstmnt_alert"
findmnt /${dstname} &>/dev/null || errf "$dstmnt_alert"
echo "==> subvolume '@${srcname}/@' mounted as '/'"
echo "==> subvolume '@${dstname}'   mounted as '/${dstname}'"

stubsrc=/efi/${srcname}
stubdst=/efi/${dstname}
mkdir -p $stubdst
cp -rfP ${stubsrc}/* ${stubdst}/
echo "==> copied vmlinuz, initramfs.img from '${stubsrc}' to '${stubdst}'"

# remove the read-only protection just in case
btrfs prop set -f -ts /${dstname}/@ ro false

btrfs subvolume delete /${dstname}/@ > /dev/null
echo "==> deleted subvolume '@${dstname}/@' from '/${dstname}/@'"

btrfs subvolume snapshot / /${dstname}/@ > /dev/null
echo "==> created snapshot of '@${srcname}/@' in '@${dstname}' at '/${dstname}/@'"

echo "==> updated fstab in '@${dstname}/@' at '/${dstname}/@/etc/fstab'"
sed -i -r \
    -e "s#/${dstname}#/${srcname}#" \
    -e "s#@${dstname}\s+0#@${srcname}   0#" \
    -e "s#@${srcname}/@#@${dstname}/@#" \
    /${dstname}/@/etc/fstab

timefile="snapshot.$(date +%Y%m%d.%H%M).txt"
rm /${dstname}/*.txt
echo "${time}" > /${dstname}/${timefile}
echo "==> created timestamp in '@${dstname}/@' at '/${dstname}/${timefile}'"
