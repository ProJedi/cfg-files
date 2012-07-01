source /etc/zsh/zprofile

eval `dircolors ~/.dircolors`

export LANG="en_US.utf8"
export BROWSER=uzbl-browser
export EDITOR="vim"
PATH=/home/projedi/.gem/ruby/1.9.1/bin:$PATH
PATH=/usr/lib/colorgcc/bin:$PATH
PATH=/home/projedi/.cabal/bin:$PATH
export PATH
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export C_INCLUDE_PATH=/usr/lib/jvm/java-6-openjdk/include
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export PAGER="/bin/sh -c \"col -b |\
   /usr/share/vim/vim73/macros/less.sh -c 'set nonu' -\""
export MANPAGER="/bin/sh -c \"col -b |\
   /usr/share/vim/vim73/macros/less.sh -c 'set ft=man nonu' -\""

alias pacman='yaourt'
alias pls='sudo'
alias poweroff='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias hibernate='sudo systemctl hibernate'
alias mnt='sudo mount'
alias umnt='sudo umount'
alias sctl='sudo systemctl'
alias tweet='t update'
alias less=/usr/share/vim/vim73/macros/less.sh

autoload omz
zstyle :omz:style theme "default"
omz init
