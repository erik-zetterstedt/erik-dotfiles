#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=vim
export VISUAL=vim

alias ls='ls -A --color=auto --group-directories-first'

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
PROMPT_COMMAND='__git_ps1 "\W" "$ " " %s"'

export FZF_DEFAULT_COMMAND='rg --files'

[ -e ~/.bash/git-prompt.sh ] && . ~/.bash/git-prompt.sh
[ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)
[ -e ~/.shellcolors ] && . ~/.shellcolors
