prompt="%F{green}%n@%m%f %F{cyan}%~%f $ "
printf '\e[5 q'

alias python='python3'
alias pip-update-all='pip list -o | tail -n +3 | awk '{print $1}' | xargs pip install -U'


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
