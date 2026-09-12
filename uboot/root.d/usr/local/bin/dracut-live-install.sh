#!/bin/bash

set -e

KVER="$1"
DEST=/boot

KDIR=/usr/lib/modules
[[ -n "$KVER" ]] || KVER=$(ls -1 $KDIR | tail -n 1)
KIMG=${KDIR}/${KVER}/vmlinuz # fedora, archlinux
[[ -f $KIMG ]] || KIMG=/boot/vmlinuz-${KVER} # ubuntu
[[ -f $KIMG ]] || exit 1

echo "==> generating initramfs-live.img ..."
dracut --force --no-hostonly \
   --add "dmsquash-live" \
   --kver "$KVER" "${DEST}/initramfs-live.img"
echo "==> installed '${DEST}/initramfs.img' (${KVER})"

install -Dm0644 $KIMG ${DEST}/vmlinuz
echo "==> installed '${DEST}/vmlinuz' (${KVER})"
