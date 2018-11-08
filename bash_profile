

# Save all commands in ~/.history/bash_history-$DATE
PROMPT_COMMAND="[ -d $HOME/.history ] || mkdir -p $HOME/.history; echo : [\$(date '+%Y-%m-%d.%H:%M:%S')] $$ $USER \$OLDPWD\; \$(history 1 | sed -E 's/^[[:space:]]+[0-9]*[[:space:]]+//g') >> $HOME/.history/bash_history-\`date +%Y%m%d\`"

HISTIGNORE="hh *"
hh() {
  cat ~/.history/* | grep "$1"
}

alias jsonlines2csv='jsonlines2csv.py'

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
# Add coretutils to path
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
export PATH="~/.scripts:$PATH"

PS1='[\u@\h:\w$(__git_ps1 " (%s)")]\$ '

# Go things
export GOPATH=$HOME
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# When running (only) postgres in containers we need to point to localhost instead of socket.
export PGHOST=localhost


# React android stuff
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fberge/google-cloud-sdk/path.bash.inc' ]; then source '/Users/fberge/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fberge/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/fberge/google-cloud-sdk/completion.bash.inc'; fi
