#
# ~/.bashrc
#

is_osx() {
    if [ "`uname`" != 'Darwin' ]; then
        return 0
    else
        return 1
    fi
}
source_dir() {
  DIR=$1/*
  #echo "Sourcing directory $DIR"
  for SCRIPT in $DIR; do
    #echo "Sourcing $SCRIPT"
    if [ ! -d $SCRIPT ]; then
    #if [ -d $SCRIPT ]; then
    #  source_dir $SCRIPT
    #else
      . $SCRIPT
    fi
    #echo "$SCRIPT sourced"
  done
}

[[ $- != *i* ]] && return

if [ -f /usr/libexec/java_home ]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi

export PGDATA='/usr/local/var/postgres'
export PGHOST=localhost

if [ -d "${HOME}/.homebrew" ]; then
    export BREW_HOME="${HOME}/.homebrew"
elif [ -d "${HOME}/.linuxbrew" ]; then
    export BREW_HOME="${HOME}/.linuxbrew"
fi

if [ -d "${BREW_HOME}" ]; then
    export PATH="${BREW_HOME}/bin:${BREW_HOME}/sbin:$PATH"
fi

export TOOLS_DIR="${HOME}/Tools/"
export PATH="$PATH:${TOOLS_DIR}"

export ANDROID_HOME="${TOOLS_DIR}/android-sdk"
export ANDROID_SDK="${ANDROID_HOME}"

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
PS1='\[$VIOLET_COLOR\]⏰   `date`\[$RESET\] $(__git_ps1 "⚡  \[$RED_COLOR\]%s\[$RESET\]")\n\[$YELLOW_COLOR\]\u@\h\[$RESET\]:\[$GREEN_COLOR\]\w\[$RESET\]> '


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

# completions
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

shopt -s checkwinsize
shopt -s cdspell

if [ -d `brew --prefix`/etc/bash_completion.d ]; then
  source_dir $(brew --prefix)/etc/bash_completion.d
fi

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -f ${TOOLS_DIR}/mvncolor/mvncolor.sh ]; then
  . ${TOOLS_DIR}/mvncolor/mvncolor.sh
fi

unset -f source_dir
export HOMEBREW_GITHUB_API_TOKEN=540c5380201c354c7fdb79a181021cf82e4b1666
