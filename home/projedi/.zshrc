source /etc/zsh/zprofile

ZSH=~projedi/.oh-my-zsh
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
plugins=(git extract git-extras history-substring-search last-working-dir svn systemd)

source $ZSH/oh-my-zsh.sh

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='$(git_prompt_info)%{$fg[cyan]%}[%~% ]%{$reset_color%}%B$%b '
RPROMPT="%(?..[%{$fg_no_bold[red]%}%?%{$reset_color%}])"

export JACK_START_SERVER=1

eval `dircolors ~projedi/.dircolors`

export LANG="en_US.utf8"
export BROWSER=firefox
export EDITOR="/usr/bin/vim"
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
alias mnt='udisksctl mount'
alias umnt='udisksctl umount'
alias l='ls -lah'
alias torr='transmission-remote'
alias open='xdg-open'
alias mpc="mpc -f '[[%artist% - ][%album% - ]%title%]'"
# Show progress while file copying
alias cpv='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'

[[ $NOTIFY_COMMAND_COMPLETE_TIMEOUT == "" ]] && NOTIFY_COMMAND_COMPLETE_TIMEOUT=3

# Notify about the last command's success or failure.
function notify-command-complete() {
  last_status=$?
  if [[ -n $start_time ]]; then
     now=`date "+%s"`
     ((diff = $now - $start_time ))
     if (( $diff > $NOTIFY_COMMAND_COMPLETE_TIMEOUT )); then
        if [[ $last_status -gt "0" ]]; then
           notify-send "Job $last_command_name failed" "Exit code: $last_status"
        else
           notify-send "Job $last_command_name finished successfully"
        fi
     fi
  fi
  unset last_command start_time last_status
}

function store-command-stats() {
  last_command=$1
  last_command_name=${1[(wr)^(*=*|sudo|ssh|-*)]}
  start_time=`date "+%s"`
}

add-zsh-hook preexec store-command-stats
add-zsh-hook precmd notify-command-complete
