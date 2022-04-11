set -U --export BROWSER firefox
set -U --export EDITOR vim
set -U --export GLFW_IM_MODULE ibus
set -U --export PATH $PATH $HOME/.local/bin
set -U --export fish_greeting ""

alias -s cp="cp -i"                # confirm before overwrite
alias -s df='df -h'                # human-readable sizes
alias -s du='du -h'                # ditto
alias -s free='free -m'            # show sizes in MB
alias -s rm='rm -iv'               # confirm before deletion
alias -s config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

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
abbr -a gchb    'git checkout -b'
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
abbr -a glo     'git log --oneline'
abbr -a gls     'git ls-files'
abbr -a glsf    'git ls-files | grep'
abbr -a gm      'git merge'
abbr -a gp      'git push'
abbr -a gr      'git reset'
abbr -a grh     'git reset HEAD'
abbr -a grha    'git reset --hard'
abbr -a grhh    'git reset HEAD --hard'
abbr -a grm     'git remote -v'
abbr -a grt     'cd (git rev-parse --show-toplevel; or echo ".")'
abbr -a gs      'git status'
abbr -a gst     'git stash'
abbr -a gstd    'git stash drop'
abbr -a gstp    'git stash pop'
abbr -a gsts    'git stash show --text'
abbr -a gwc     'git whatchanged -p --abbrev-commit --pretty=medium'

abbr -a p       'pdm'
abbr -a pa      'pdm add'
abbr -a pi      'pdm install'
abbr -a pr      'pdm run'
abbr -a prp     'pdm run python'
abbr -a pc      'pdm sync'
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
