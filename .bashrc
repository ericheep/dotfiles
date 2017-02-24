# enable colors
export CLICOLOR=1
export GOPATH=$HOME/workspace

# terminal prompt
# export PS1='\[\e[33m\]\h\[\e[34m\]:\W\[\e[33m\]$(__git_ps1 "(%s)")\[\e[0m\] \u\$ '
export PS1='\[\e[33m\]\h\[\e[31m\]:\W\[\e[0m\]$ '

# reload!
alias reload="source ~/.bashrc"

# cause I don't use python2 like never
# alias py2="pyenv shell 2.7.11"
# alias py3="pyenv shell 3.5.1"
# alias py3.4="pyenv shell 3.4.0"

# other
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias mir="cd ~/workspace/science/libraries/python/kad/kad/mir"
alias website="python3 -m http.server 8000"
