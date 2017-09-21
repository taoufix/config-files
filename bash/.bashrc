# -*- Shell-Script -*-

## Path
export PATH="${HOME}/bin:${PATH}"

## PS1
PS1='\[\033[01;34m\][\[\033[01;35m\]\u@\h\[\033[01;34m\] \W][\[\033[01;31m\]\j\[\033[01;34m\]]\$\[\033[00m\] '

## History
export HISTIGNORE="&:ls:cd:[bf]g:rm:exit"
export HISTCONTROL="ignoreboth"
export TERM=xterm

## Aliases
alias rm='rm -i'
alias grep='grep --color'
alias ls='ls --color=auto'
alias httpserver='python -m SimpleHTTPServer'
alias trash='\rm -vf *~; true'
