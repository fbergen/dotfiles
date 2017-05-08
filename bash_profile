

# Save all commands in ~/.history/bash_history-$DATE
PROMPT_COMMAND="[ -d $HOME/.history ] || mkdir -p $HOME/.history; echo : [\$(date '+%Y-%m-%d.%H:%M:%S')] $$ $USER \$OLDPWD\; \$(history 1 | sed -E 's/^[[:space:]]+[0-9]*[[:space:]]+//g') >> $HOME/.history/bash_history-\`date +%Y%m%d\`"

HISTIGNORE="hh *"
alias hh="cat ~/.history/* | grep "


source ~/git-completion.bash
source ~/git-prompt.sh

PS1='[\u@\h:\w$(__git_ps1 " (%s)")]\$ '

# Go things
export GOPATH=~/go 
export PATH=$PATH:/usr/local/opt/go/libexec/bin


