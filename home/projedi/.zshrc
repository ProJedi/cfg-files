source /etc/zsh/zprofile

ZSH=~projedi/.oh-my-zsh
ZSH_THEME="eastwood"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

RPROMPT="%(?..[%{$fg_no_bold[red]%}%?%{$reset_color%}])"

export JACK_START_SERVER=1

eval `dircolors ~projedi/.dircolors`

export LANG="en_US.utf8"
export BROWSER=chromium
export EDITOR="vim"
PATH=~projedi/.bin:$PATH
PATH=~projedi/.cabal/bin:$PATH
export PATH
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export C_INCLUDE_PATH=/usr/lib/jvm/java-6-openjdk/include
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export PAGER=/usr/bin/less
export MANPAGER=$PAGER

alias pls='sudo'
alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
alias mnt='sudo mount'
alias umnt='sudo umount'
alias sctl='sudo systemctl'
alias l='ls -lah'
alias torr='transmission-remote'
alias open='xdg-open'
alias mpc="mpc -f '[[%artist% - ][%album% - ]%title%]'"
