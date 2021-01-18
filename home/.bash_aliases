#!/usr/bin/env bash
WORKSPACE=~/workspace
# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
  if [[ $(test -r ~/.dircolors) ]]; then
    eval "$(dircolors -b ~/.dircolors)"
   else
     eval "$(dircolors -b)"
  fi

  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# my aliases
alias r='reset &&'
alias ws='cd ${WORKSPACE}'
alias p3='python3'
alias rc='rails c'
alias pws='cd ~/personal-ws'
scd()
{
  if [[ ! $(cd "$1" &>/dev/null) ]]; then
    cd ${WORKSPACE}/"$1" || return
  fi
}

alias note='ssh -t note'
alias nde='ssh -t note docker exec -it'

# git aliases
alias gc='git cola'
alias gd='git diff -w --word-diff=color'
alias gm='git mergetool'
alias go='git checkout'
alias gr='git rebase --autostash '
alias gf='git fetch -p'
alias gs='git status && git log --oneline -1'
alias gri='git rebase -i --autostash'
alias gpl='git pull'

alias gsl='gitp3 smartlog'
alias gsb='gitp3 smartbranch'
alias gsf='gitp3 smartfetch'
alias gsp='gitp3 smartpush'
alias gsc='gitp3 smartcommit'

alias gcpc='git cherry-pick --continue'
alias grbc='git rebase --continue'
alias grh='_comando "git reset --hard HEAD~"'
alias grs='_comando "git reset --soft HEAD~"'
alias gl='_comando "git log --color --graph --pretty=format:\"%C(yellow)%h%Creset - %Cgreen(%ci) %C(bold blue)<%an>%Creset%C(bold yellow)%d%n%C(bold)%s\" --abbrev-commit -" noEcho'

# Cores
NORMAL=$(tput sgr0)
AMARELO=$(tput setaf 3)

# Comando
# Executa um comando passando um argumento numérico, se nenhum argumento numérico for passado, executa o comando passando 1 como argumento numérico
# argumentos:
# - 1 = comando
# - 2 'noEcho' para não fazer o echo ou o argumento numérico
# - 3 o argumento o 2 não seja o argumento numérico
_comando() {
	p1=$1
	p2=$2
	p3=$3
	ecoar=1
	if [[ "$p2" == "noEcho" ]]; then
		ecoar=0
		p2=${p3}
	fi

	if [[ "$p2" == "" ]]; then
		p2=1
	fi

	cmd=${p1}${p2}
	if [[ ${ecoar} -ne 0 ]]; then
		echo "Executando $AMARELO$cmd$NORMAL"
	fi
	eval ${cmd}
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias please='sudo'
alias tailf='tail -F'

alias pipeline='qb-beta pipeline'

alias qbcprod='ssh -t ubuntu@tools.querobolsa.space "./dkc heitor"'
alias qbbprod='ssh -t ubuntu@tools.querobolsa.space "./dkb heitor"'

# docker
alias docker_stop_all='docker stop $(docker ps -q)'

# CLI
if [[ -n "$CLI_PROD" ]]; then
    alias ex='cli elixir'
    alias dk='cli docker'
    alias udc='cli unifieddockercompose'
else
    alias udc='PYTHONPATH="~/workspace/cli/:~/workspace/cli/polidoro_cli/" python3 -m polidoro_cli.main unifieddockercompose'
    alias dk='PYTHONPATH="~/workspace/cli/:~/workspace/cli/polidoro_cli/" python3 -m polidoro_cli.main docker'
    alias ex='PYTHONPATH="~/workspace/cli/:~/workspace/cli/polidoro_cli/" python3 -m polidoro_cli.main elixir'
    alias cli='PYTHONPATH="~/workspace/cli/:~/workspace/cli/polidoro_cli/" python3 -m polidoro_cli.main'
    alias rb='PYTHONPATH="~/workspace/cli/:~/workspace/cli/polidoro_cli/" python3 -m polidoro_cli.main ruby'
fi
