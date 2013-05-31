source .zshrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && /usr/lib/systemd/systemd --user
