prompt="%F{green}%n@%m%f %F{cyan}%~%f $ "
printf '\e[5 q'

alias python='python3'
alias pip='pip3'


eval "$(/usr/local/bin/brew shellenv)"



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
znap source marlonrichert/zsh-autocomplete
