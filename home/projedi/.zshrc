source /etc/zsh/zprofile

export LANG="en_US.utf8"
export BROWSER=uzbl-browser
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS="-Rc"
export EDITOR="vim"
PATH=/home/projedi/.gem/ruby/1.9.1/bin:$PATH
PATH=/usr/lib/colorgcc/bin:$PATH
PATH=/home/projedi/matlab-r2011a/bin:$PATH
PATH=/home/projedi/maple14/bin:$PATH
PATH=/home/projedi/.cabal/bin:$PATH
export PATH
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export C_INCLUDE_PATH=/usr/lib/jvm/java-6-openjdk/include

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
alias view='vim -R'
alias tweet='t update'

autoload omz
zstyle :omz:style theme "default"
plugins=(extract)
omz init
