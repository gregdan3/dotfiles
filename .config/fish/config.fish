set -U --export BROWSER firefox
set -U --export EDITOR vim
set -U --export GLFW_IM_MODULE ibus
set -U --export GPG_TTY (tty)
set -U --export PATH $PATH /home/gregdan3/.local/bin

alias cp="cp -i"                # confirm before overwrite
alias df='df -h'                # human-readable sizes
alias du='du -h'                # ditto
alias free='free -m'            # show sizes in MB
alias rm='rm -iv'               # confirm before deletion

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

abbr -a g       'git'
abbr -a ga      'git add'
abbr -a gb      'git branch'
abbr -a gba     'git branch -a'
abbr -a gbb     'git branch -b'
abbr -a gc      'git commit -v'
abbr -a gc!     'git commit -v --amend'
abbr -a gca     'git commit -v -a'
abbr -a gca!    'git commit -v -a --amend'
abbr -a gch     'git checkout'
abbr -a gchd    'git checkout -b'
abbr -a gchw    'git checkout working'
abbr -a gcl     'git config --list'
abbr -a gclean  'git reset --hard; and git clean -dfx'
abbr -a gcm     'git commit -m'
abbr -a gcm!    'git commit --amend -m'
abbr -a gcount  'git shortlog -sn'
abbr -a gcp     'git cherry-pick'
abbr -a gd      'git diff'
abbr -a gdc     'git diff --cached'
abbr -a gds     'git diff --staged'
abbr -a gf      'git fetch'
abbr -a gl      'git pull'
abbr -a glg     'git log --stat --max-count=10'
abbr -a glgg    'git log --graph --max-count=10'
abbr -a glgga   'git log --graph --decorate --all'
abbr -a glo     'git log --oneline'
abbr -a gls     'git ls-files'
abbr -a glsf    'git ls-files | grep'
abbr -a gm      'git merge'
abbr -a gp      'git push'
abbr -a gr      'git reset'
abbr -a grh     'git reset HEAD'
abbr -a grha    'git reset --hard'
abbr -a grhh    'git reset HEAD --hard'
abbr -a grm     'git remote'
abbr -a grmv    'git remote -v'
abbr -a grt     'cd (git rev-parse --show-toplevel; or echo ".")'
abbr -a grup    'git remote update'
abbr -a gs      'git status'
abbr -a gss     'git status -s'
abbr -a gst     'git stash'
abbr -a gstd    'git stash drop'
abbr -a gstp    'git stash pop'
abbr -a gsts    'git stash show --text'
abbr -a gsw     'git switch'
abbr -a gunwip  'git log -n 1 | grep -q -c wip; and git reset HEAD~1'
abbr -a gwc     'git whatchanged -p --abbrev-commit --pretty=medium'
abbr -a gwip    'git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "wip"'

abbr -a p       'pdm'
abbr -a pa      'pdm add'
abbr -a pi      'pdm install'
abbr -a pr      'pdm run'
abbr -a prp     'pdm run python'
abbr -a ps      'pdm sync'
abbr -a pu      'pdm update'

abbr -a d       'doppler'
abbr -a dr      'doppler run --'
abbr -a drpi    'doppler run -- pdm install'
abbr -a drpr    'doppler run -- pdm run'
abbr -a drprp   'doppler run -- pdm run python'
abbr -a drps    'doppler run -- pdm sync'
abbr -a drpu    'doppler run -- pdm update'
abbr -a ds      'doppler setup'
abbr -a dss     'doppler secrets'

abbr -a v       'vim'
abbr -a vi      'vim'
abbr -a vim     'vim'

abbr -a boxdraw           'curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
abbr -a publicipv4        'dig +short myip.opendns.com @resolver1.opendns.com'
abbr -a publicipv6        'dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'
abbr -a weather           'curl -s "wttr.in/?format=%c+%l:+%C+%t+%w+%h" | sed "s/,.*:/:/g" | sed "s/  / /g" > ~/.config/weather'

thefuck --alias oof | source
starship init fish | source
