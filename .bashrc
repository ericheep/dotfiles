# enable colors
export CLICOLOR=1

# terminal prompt
export PS1="\W $ "

# reload!
alias reload="source ~/.bashrc"
alias website="python3 -m http.server 8000"
alias miscellany="python3 ~/git/miscellany/manage.py runserver"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# set nvmdir
export NVM_DIR="$HOME/.nvm"

# this loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

 # this loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias pgstart="pg_ctl -D /usr/local/var/postgres -l logfile start"

