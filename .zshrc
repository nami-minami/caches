#bindkey -v
#==============================================================================
#prompt
#==============================================================================
case `uname -s` in
    Darwin)
        source /usr/local/etc/bash_completion.d/git-prompt.sh
        ;;

    Linux)
        source /etc/bash_completion.d/git-prompt
        ;;
esac

#VIMODE_INSERT=
#VIMODE_NORMAL=
#VIMODE_VISUAL=

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto
setopt PROMPT_SUBST 

PROMPT='%F{green}%n@%m%f %F{cyan}%~%f%F{magenta} $(__git_ps1 "(%s)")%f $ '
#printf '\e[5 q'


#==============================================================================
#path
#==============================================================================
export DENO_INSTALL="/home/nami/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

#==============================================================================
#alias
#==============================================================================
alias reload="source ~/.zshrc"
alias ls="ls -G"
alias 3.12="source ~/.pyenv/3.12/bin/activate"


#==============================================================================
#completion
#==============================================================================
autoload -Uz compinit

# Installing Znap
[[ -f ~/.znap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap

source ~/.znap/zsh-snap/znap.zsh  

# plug install
znap source zsh-users/zsh-syntax-highlighting
#znap source marlonrichert/zsh-autocomplete

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.4.1/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)
