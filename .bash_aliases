source "`brew --prefix`/etc/grc.bashrc"

alias nano='nano -c'

# colors support
if [ is_osx ]; then
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias la='ls -lAh'
alias ll='la'
alias ncmpc='ncmpc -c'
alias gitk="/usr/bin/wish $(which gitk)"
alias vi="vim -u ~/.virc"
alias logcat="adb logcat -vtime"
alias pg-start='pg_ctl -l $PGDATA/server.log start'
alias pg-stop='pg_ctl stop -m fast'
alias pg-status='pg_ctl status'
alias pg-restart='pg_ctl reload'
