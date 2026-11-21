#!/usr/bin/bash

SELF_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))
WLCTL=${SELF_DIR}/wlctl.sh

$WLCTL init-fcitx5
$WLCTL init-polkit
$WLCTL init-icon-theme
$WLCTL init-wallpaper

### ~/.bashrc
# https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
# export QT_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx
# [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$XDG_VTNR" -eq 1 ]] && exec sway
# [[ -z "$WAYLAND_DISPLAY" ]] && [[ "$XDG_VTNR" -eq 1 ]] && kmscon-launch-gui sway
