# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Tmux:
if command -v tmux &> /dev/null && [ -n "$PS1" ] &&\
  [[ ! "$TERM" =~ screen ]] &&\
  [[ ! "$TERM" =~ tmux ]] &&\
  [ -z "$TMUX" ]; then
  exec tmux
fi

# Environemnt:
export TERM=tmux-256color
export EDITOR=vim

export HOUR=$(date +%H)
export BACKGROUND=''

if [ $HOUR -ge 18 ]; then
  BACKGROUND=dark

elif [ $HOUR -ge 7 ]; then
  BACKGROUND=light

elif [ $HOUR -ge 0 ]; then
  BACKGROUND=dark
fi

# History:
HISTFILESIZE=10000
HISTSIZE=2000
HISTCONTROL=ignoredups
shopt -s histappend

# Colors:
clr='\[\033[00m\]'       # Reset

blk='\[\033[00;30m\]'    # Black
red='\[\033[00;31m\]'    # Red
grn='\[\033[00;32m\]'    # Green
ylw='\[\033[00;33m\]'    # Yellow
blu='\[\033[00;34m\]'    # Blue
pur='\[\033[00;35m\]'    # Purple
cyn='\[\033[00;36m\]'    # Cyan
wht='\[\033[00;37m\]'    # White

bblk='\[\033[01;30m\]'   # Black
bred='\[\033[01;31m\]'   # Red
bgrn='\[\033[01;32m\]'   # Green
bylw='\[\033[01;33m\]'   # Yellow
bblu='\[\033[01;34m\]'   # Blue
bpur='\[\033[01;35m\]'   # Purple
bcyn='\[\033[01;36m\]'   # Cyan
bwht='\[\033[01;37m\]'   # White

# Prompt:
PS1="$grn\u$clr@\h$clr:$blu\W$clr\$ "

# Aliases:
alias ls='ls -A --color=auto -F'
alias ll='tree -alC -I .git -I node_modules -I __pychache__'
alias la='ls -1 -hs'
alias sb='source ~/.bashrc'
alias mkdir='mkdir -pv'
alias rm='rm -fv'

alias ..='cd ..;pwd'          # Move to the parent folder.
alias ...='cd ../..;pwd'      # Move up two parent folders.
alias ....='cd ../../..;pwd'  # Move up three parent folders.

# Git:
alias gs='git status -s'
