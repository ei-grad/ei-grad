ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ei-grad"
#ZSH_THEME=jreese
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"

export PATH=$HOME/.local/bin:$HOME/go/bin:$PATH
export WORKON_HOME=$HOME/.virtualenvs

plugins=(git virtualenvwrapper virtualenv pyutils colored-man-pages timewarrior)

source /home/ei-grad/anaconda3/etc/profile.d/conda.sh

gh() {
    cd ~/repos/github.com
    [ -d "`dirname $1`" ] || mkdir `dirname $1`
    cd "`dirname $1`"
    [ -d "`basename $1`" ] || git clone git@github.com:$1.git
    cd "`basename $1`"
}

[ -e $HOME/.profile ] && source $HOME/.profile

source $ZSH/oh-my-zsh.sh

[ -e "`which direnv`" ] && eval "$(direnv hook zsh)"

# key bindings
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[5~' beginning-of-history
bindkey '^[[6~' end-of-history
bindkey '^[[3~' delete-char
bindkey '^[[2~' quoted-insert
bindkey '^[[5C' forward-word
bindkey '^[Oc' emacs-forward-word
bindkey '^[[5D' backward-word
bindkey '^[Od' emacs-backward-word
bindkey '^[e[C' forward-word
bindkey '^[e[D' backward-word
bindkey '^H' backward-delete-word
# for rxvt
bindkey '^[[8~' end-of-line
bindkey '^[[7~' beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
# for freebsd console
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
# completion in the middle of a line
bindkey '^I' expand-or-complete

alias start='sudo systemctl start'
alias stop='sudo systemctl stop'
alias restart='sudo systemctl restart'
alias curltime="curl -s -w 'HTTP/%{http_version} %{http_code} \"%{content_type}\" dns=%{time_namelookup} tcp=%{time_connect} ssl=%{time_appconnect} total=%{time_total} size=%{size_download}\n' -o /dev/null"

export LANG=ru_RU.UTF-8
export GOPATH=$HOME/.local
export LESS=-FRKX
export EDITOR=/usr/bin/vim
export WINEARCH=win32
export WINEPREFIX=$HOME/.wine
export GOPATH=$HOME/go

setopt nonomatch

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/ei-grad/yandex-cloud/path.bash.inc' ]; then source '/home/ei-grad/yandex-cloud/path.bash.inc'; fi
