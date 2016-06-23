#
# ~/.bashrc
#

[[ $- != *i* ]] && return

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

export PGDATA='/usr/local/var/postgres'
export PGHOST=localhost

export ANDROID_HOME="${HOME}/Tools/android-sdk"
export ANDROID_SDK="${ANDROID_HOME}"

export PATH="${HOME}/.homebrew/bin:/Users/$(whoami)/.homebrew/sbin:$PATH"
export PATH="$PATH:${HOME}/Tools"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

export LESS="-R"
export EDITOR="vim"

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

RED_COLOR=$(tput setaf 1)
GREEN_COLOR=$(tput setaf 2)
YELLOW_COLOR=$(tput setaf 3)
VIOLET_COLOR=$(tput setaf 5)
BG_RED_COLOR=$(tput setab 1)
BG_GREEN_COLOR=$(tput setab 2)
BG_YELLOW_COLOR=$(tput setab 3)
RESET=$(tput sgr0)

# old prompt:
PS1='\[$VIOLET_COLOR\]ð   `date`\[$RESET\] $(__git_ps1 "⚡  \[$RED_COLOR\]%s\[$RESET\]")\n\[$YELLOW_COLOR\]\u@\h\[$RESET\]:\[$GREEN_COLOR\]\w\[$RESET\]> '


HISTCONTROL=ignoreboth
HISTIGNORE='reset:clear'
export HISTSIZE="10000"

shopt -s histappend
shopt -s cmdhist
shopt -s lithist
PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S '

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

shopt -s checkwinsize
shopt -s cdspell

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ~/Tools/mvncolor/mvncolor.sh ]; then
  . ~/Tools/mvncolor/mvncolor.sh
fi

export HOMEBREW_GITHUB_API_TOKEN=540c5380201c354c7fdb79a181021cf82e4b1666
