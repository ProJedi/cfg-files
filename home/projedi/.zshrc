export BROWSER=chromium-browser
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS="-Rc"
export EDITOR="vim"
PATH=/usr/lib/colorgcc/bin:$PATH
PATH=/home/projedi/matlab-r2011a/bin:$PATH
PATH=/home/projedi/maple14/bin:$PATH
PATH=/home/projedi/.cabal/bin:$PATH
PATH=/home/projedi/.bin:$PATH
export PATH
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1

alias update='yaourt -Syua --noconfirm'
alias pacman='yaourt'
alias more='less'
alias pls='sudo'
alias office2pdf='libreoffice -convert-to pdf'
alias poweroff='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'
alias mnt='sudo mount'
alias umnt='sudo umount'
alias sctl='sudo systemctl'

autoload omz
zstyle :omz:style theme "default"
plugins=(extract)
omz init
