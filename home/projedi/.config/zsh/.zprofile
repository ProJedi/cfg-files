#source /etc/zsh/zprofile

export LANG="en_US.utf8"
export BROWSER=firefox
export EDITOR="/usr/bin/vim -u ~projedi/.config/vim/vimrc -i ~/.cache/viminfo"
PATH=~projedi/.bin:$PATH
PATH=~projedi/.cabal/bin:$PATH
export PATH
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
export C_INCLUDE_PATH=/usr/lib/jvm/java-6-openjdk/include
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export LESSHISTFILE=~projedi/.cache/lesshst
#export PAGER=/usr/bin/less
#export MANPAGER=$PAGER
#export JACK_START_SERVER=1

eval `dircolors ~projedi/.dircolors`

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && /usr/lib/systemd/systemd --user
