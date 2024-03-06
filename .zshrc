prompt="%F{green}%n@%m%f %F{cyan}%~%f $ "
printf '\e[5 q'

alias reload="source ~/.zshrc"
alias ls="ls -G"

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
