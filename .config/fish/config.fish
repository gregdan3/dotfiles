alias cp="cp -i"                # confirm before overwrite
alias df='df -h'                # human-readable sizes
alias du='du -h'                # ditto
alias free='free -m'            # show sizes in MB
alias rm='rm -iv'               # confirm before deletion
alias ':q'=exit
alias ':e'=vim
alias v=vim
alias vi=vim
alias vm=vim
alias ivm=vim
alias vmi=vim
alias task='~/.task/task-git.sh'
alias taskp='~/.task/task-git.sh --push'
alias taskl='~/.task/task-git.sh --pull'

bind \e\[P delete-char

# alias for git directory belonging to my dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
