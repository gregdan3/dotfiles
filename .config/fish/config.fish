bind \e\[P delete-char

alias cp="cp -i"                # confirm before overwrite
alias df='df -h'                # human-readable sizes
alias du='du -h'                # ditto
alias free='free -m'            # show sizes in MB
alias rm='rm -iv'               # confirm before deletion

# alias for git directory belonging to my dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

thefuck --alias oof | source

set PATH $PATH /home/gregdan3/.local/bin

starship init fish | source
