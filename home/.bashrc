# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# include .bash_colors if it exists
if [[ -f "$HOME/.bash_colors" ]]; then
    source "$HOME/.bash_colors"
fi

# include .bash_env if it existsr
if [[ -f "$HOME/.bash_env" ]]; then
    while read line; do
        if [[ $line != \#* ]] ; then
            export ${line}
        fi
    done < "$HOME/.bash_env"
fi

# Various variables you might want for your PS1 prompt instead
Time24h="\t" #HH:MM:SS
Time24a="\A" #HH:MM
Time12h="\T"
Time12a="\@"
PathShort="\W"
PathFull="\w"
NewLine="\n"
Jobs="\j"
HostShort="\h"
HostFull="\H"

# If not running interactively, don't do anything
[[ -z "$PS1" ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTIGNORE="clear":"reset":"cd":"cd ~":"cd ..":"cd -":"fg":"ls":"la":"ll"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "$debian_chroot" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "${TERM}" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [[ -n "$force_color_prompt" ]]; then
    if [[ -x /usr/bin/tput ]] && tput setaf 1 >& /dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# put branch and dif in the prompt, also if the reposotory is clean
if [[ "$color_prompt" = yes ]]; then
    export PS1="\[${Yellow}\]${USER}@$HostShort\[${Color_Off}\]:\[${Blue}\]$PathFull"'$(git status &>/dev/null;\
        if [[ $? -eq 0 ]]; then \
    sts=`git status -sb | grep "ahead\|behind\|frente\|atrás"`; \
    if [[ "$sts" != "" ]]; then \
        sts=${sts#*[}; \
        sts=-${sts%]*}; \
    fi; \
            if [[ "$(git status -sb | sed '1d' )" == "" ]]; then \
                # @4 - Clean repository - nothing to commit
            echo "'"\[${Green}\]"'" \($(__git_ps1 "%s")$sts\); \
            else \
                # @5 - Changes to working tree
                echo "'"\[${IRed}\]"'" {$(__git_ps1 "%s")$sts}; \
            fi; \
        fi)'"\[${Bold}${Yellow}\]\[${Color_Off}\]\$ "

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "${TERM}" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -en "\033]0;`pwd | sed \"s/.*\///\"`\a"'
    #    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export PATH="$HOME/bin:$PATH"


