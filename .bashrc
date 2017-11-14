# enable colors
export CLICOLOR=1

# terminal prompt
export PS1="\W $ "
export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

# reload!
alias reload="source ~/.bashrc"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias website="python3 -m http.server 8000"
alias miscellany="python3 ~/git/miscellany/manage.py runserver"
