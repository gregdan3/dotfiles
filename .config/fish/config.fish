alias cp="cp -i"                # confirm before overwrite
alias df='df -h'                # human-readable sizes
alias du='du -h'                # ditto
alias free='free -m'            # show sizes in MB
alias rm='rm -iv'               # confirm before deletion

# alias for git directory belonging to my dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
set -gx GPG_TTY (tty)
thefuck --alias oof | source
starship init fish | source
