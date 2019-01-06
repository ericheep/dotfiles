# enable colors
export CLICOLOR=1

# terminal prompt
export PS1="\W $ "

# reload!
alias reload="source ~/.bashrc"
alias website="python3 -m http.server 8000"
alias miscellany="python3 ~/git/miscellany/manage.py runserver"
alias eqm="source ~/venvs/eqm/bin/activate"
alias heep="source ~/venvs/heep/bin/activate"

# set nvmdir
export NVM_DIR="$HOME/.nvm"

# this loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

 # this loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias pgstart="pg_ctl -D /usr/local/var/postgres -l logfile start"
