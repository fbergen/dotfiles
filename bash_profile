uname_out="$(uname -s)"
case "${uname_out}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${uname_out}"
esac

# Save all commands in ~/.history/bash_history-$DATE
# Make sure the directory exists
[ -d $HOME/.history ] || mkdir -p $HOME/.history;
# echo last command (max 1000 chars to the history)
PROMPT_COMMAND="echo : [\$(date '+%Y-%m-%d.%H:%M:%S')] $$ $USER \$OLDPWD\; \$(history 1 | sed -E 's/^[[:space:]]+[0-9]*[[:space:]]+//g' | cut -c -1000) >> $HOME/.history/bash_history-\`date +%Y%m%d\`"

HISTIGNORE="hh *"
hh() {
  cat ~/.history/* | fzf --query="$@"
}


alias jsonlines2csv='jsonlines2csv.py'

# Add bin/sbin
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="~/.scripts:$PATH"

if [ ${machine} = "Mac" ]; then
  # Mac
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  # Add coretutils to path
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"

elif [ ${machine} = "Linux" ]; then
  # Linux
  :;
fi


# Git stuff
if [ -f ~/git-prompt.sh ]; then
  source ~/git-prompt.sh
  PS1='[\u@\h:\w$(__git_ps1 " (%s)")]\$ '
fi
alias gp="git push -u"
alias gitclean="git fetch --prune && git branch -vv | grep ': gone]'| grep -v '\*' | awk '{ print $1; }' | xargs git branch -D"

# Neovim
alias vim="nvim -p"

# Go things
export GOPATH=$HOME
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Rust
export PATH=$PATH:$HOME/.cargo/bin

# When running (only) postgres in containers we need to point to localhost instead of socket.
export PGHOST=localhost


# React android stuff
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Python
alias ackp="ack --type=python"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fberge/google-cloud-sdk/path.bash.inc' ]; then source '/Users/fberge/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fberge/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/fberge/google-cloud-sdk/completion.bash.inc'; fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PATH=/Users/fberge/.local/bin:$PATH

alias vdj="vd -f=jsonl"
alias rgp="rg -tpy"
export PATH="/usr/local/opt/node@10/bin:$PATH"
export PBCAT_PROTO_ROOT="."

export PATH="$HOME/.cargo/bin:$PATH"
