# enable colors
export CLICOLOR=1
export GOPATH=$HOME/workspace

# terminal prompt
export PS1="\W $ "

# reload!
alias reload="source ~/.bashrc"

# other
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias website="python3 -m http.server 8000"
 
#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi
