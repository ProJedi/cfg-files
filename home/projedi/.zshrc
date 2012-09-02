source /etc/zsh/zprofile

autoload omz
zstyle :omz:style theme "default"
omz init

eval `dircolors ~/.dircolors`

export LANG="en_US.utf8"
export BROWSER=chromium
export EDITOR="vim"
PATH=/usr/bin/vendor_perl:$PATH
PATH=~/.android-sdks/platform-tools:~/.android-sdks/tools:$PATH
PATH=~/.bin:$PATH
PATH=/usr/lib/colorgcc/bin:$PATH
PATH=~/.cabal/bin:$PATH
export PATH
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export C_INCLUDE_PATH=/usr/lib/jvm/java-6-openjdk/include
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export PAGER=/usr/bin/less
export MANPAGER=$PAGER

alias nmcli='sudo nmcli'
alias pacman='yaourt'
alias pls='sudo'
alias poweroff='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias hibernate='sudo systemctl hibernate'
alias mnt='sudo mount'
alias umnt='sudo umount'
alias sctl='sudo systemctl'
alias l='ls -lah'
