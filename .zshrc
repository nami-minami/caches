source $HOME/.zshrc.rc

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$PATH":"$HOME/.pub-cache/bin"

export CHROME_EXECUTABLE=chromium

export PATH="$PATH":"$HOME/src/android-studio/bin"

export PATH="$PATH":"/opt/cmdline-tools/bin"

export ANDROID_HOME="$HOME/Android/Sdk"
