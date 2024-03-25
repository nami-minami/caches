#prompt
source /usr/local/etc/bash_completion.d/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST 

PROMPT='%F{green}%n@%m%f %F{cyan}%~%f%F{magenta} $(__git_ps1 "(%s)")%f $ '
#printf '\e[5 q'


#alias
alias reload="source ~/.zshrc"
alias ls="ls -G"


#completion
autoload -Uz compinit && compinit


#if [ $TERM != "screen" ]; then
#    screen
#fi
#
# Installing Znap
[[ -f ~/.znap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap

source ~/.znap/zsh-snap/znap.zsh  

# plug install
znap source zsh-users/zsh-syntax-highlighting
#znap source marlonrichert/zsh-autocomplete
