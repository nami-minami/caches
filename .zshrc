# options
setopt no_beep
setopt interactivecomments
setopt GLOB_SUBST
setopt GLOB_COMPLETE


#==============================================================================
# keybind
#=============================================================================
bindkey -r '^J'
bindkey -r '^G'


#==============================================================================
# prompt
#==============================================================================
case `uname -s` in
    Darwin)
        case `uname -m` in
            arm64)
                source /opt/homebrew/etc/bash_completion.d/git-prompt.sh
                ;;
            x86_64)
                source /usr/local/etc/bash_completion.d/git-prompt.sh
                ;;
        esac
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
# path
#==============================================================================
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cache/dein/repos/github.com/thinca/vim-themis/bin


#==============================================================================
# alias
#==============================================================================
alias reload="source ~/.zshrc"
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"
alias 3.12="source ~/.pyenv/3.12/bin/activate"
alias 3.13="source ~/.pyenv/3.13/bin/activate"
alias pysource="source **/bin/activate"


#==============================================================================
# completion
#==============================================================================
autoload -Uz compinit && compinit -i
source <(docker completion zsh) && \
source <(deno completions zsh) && \
source <(npm completion zsh) && \
source <(go-licenses completion zsh) && \

# Installing Znap
[[ -f ~/.znap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.znap/zsh-snap

source ~/.znap/zsh-snap/znap.zsh  

# plug install
znap source zsh-users/zsh-syntax-highlighting
#znap source marlonrichert/zsh-autocomplete

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/nami/go/bin/gocomplete go

#==============================================================================
# environment
#==============================================================================

# FVM
export PATH="/home/nami/.fvm_flutter/bin:$PATH"

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/nami/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/nami/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

