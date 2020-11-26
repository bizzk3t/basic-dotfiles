unalias -a
export EDITOR="vim"
export DOTFILES="$HOME/.dotfiles"
export TERM=xterm-256color

export LC_ALL="C"
export LANG="en_US.UTF-8"

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTIGNORE="exit:history:clear:ls"

export LESS_TERMCAP_mb=$(printf '\e[1;31m')
export LESS_TERMCAP_md=$(printf '\e[1;33m')

export LESS_TERMCAP_me=$(printf '\e[0m')

export LESS_TERMCAP_so=$(printf '\e[01;44;37m')
export LESS_TERMCAP_se=$(printf '\e[0m')

export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_us=$(printf '\e[01;37m')

server() {
  python3 -m http.server "$@"
}

md() {
  mkdir -p "$@" && cd "$@"
}

clone() {
  git clone "https://github.com/$1"
}

alias dots="cd $DOTFILES"

alias p="cd ~/projects"
alias cdp="cd ~/projects"

alias ':q'="exit"
alias .....="cd ../../../.."
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias cd..="cd .."
alias cs="cd"

alias sap="sudo apt install"

alias ports="lsof -i -P -n"
alias mox="chmod +x"

alias ls="ls -AFGh --color=always --group-directories-first --ignore=\.DS_Store"
alias a="ls -A"
alias al="ls -lA"
alias l="ls"
alias la="ls -lA"
alias ld="ls"
alias ll="ls -l"
alias s="ls"
alias sl="ls"
alias sls="ls"

[[ $- == *i* ]] && stty -ixon
shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dirspell 2> /dev/null
shopt -s globstar 2> /dev/null
shopt -s nocaseglob
