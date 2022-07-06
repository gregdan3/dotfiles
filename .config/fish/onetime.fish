#!/bin/fish
for a in (abbr -l)
    abbr -e $a
end

set -U --export BROWSER firefox
set -U --export EDITOR vim
set -U --export GLFW_IM_MODULE ibus
set -U --export XDG_CACHE_HOME $HOME/.cache
set -U --export XDG_CONFIG_HOME $HOME/.config
set -U --export XDG_DATA_HOME $HOME/.local/share
set -U --export XDG_STATE_HOME $HOME/.local/state
set -U --export fish_greeting ""

abbr -a boxdraw 'curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
abbr -a c 'xsel --clipboard'
abbr -a config '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
abbr -a cp 'cp -i'
abbr -a d doppler
abbr -a dcl 'docker container ls'
abbr -a de 'docker exec -it'
abbr -a df 'df -h'
abbr -a di 'docker inspect'
abbr -a dil 'docker image ls'
abbr -a dl 'docker logs'
abbr -a dp 'docker ps'
abbr -a dpa 'docker ps --all'
abbr -a dr 'doppler run --'
abbr -a drdc 'doppler run -- docker compose'
abbr -a drpi 'doppler run -- pdm install'
abbr -a drpr 'doppler run -- pdm run'
abbr -a drprp 'doppler run -- pdm run python'
abbr -a drprv 'doppler run -- pdm run lvim'
abbr -a drps 'doppler run -- pdm sync'
abbr -a drpu 'doppler run -- pdm update'
abbr -a dry 'doppler run -- yarn'
abbr -a dryb 'doppler run -- yarn build'
abbr -a ds 'doppler setup'
abbr -a dsl 'docker service ls'
abbr -a dss 'doppler secrets'
abbr -a dtl 'docker stack ls'
abbr -a dtp 'docker stack ps'
abbr -a du 'du -h'
abbr -a g git
abbr -a ga 'git add'
abbr -a gb 'git branch'
abbr -a gba 'git branch -a'
abbr -a gbb 'git branch -b'
abbr -a gc 'git commit -v'
abbr -a gc! 'git commit -v --amend'
abbr -a gca 'git commit -v -a'
abbr -a gca! 'git commit -v -a --amend'
abbr -a gch 'git checkout'
abbr -a gchb 'git checkout -b'
abbr -a gclean 'git reset --hard; and git clean -dfx'
abbr -a gcm 'git commit -m'
abbr -a gcm! 'git commit --amend -m'
abbr -a gcount 'git shortlog -sn'
abbr -a gcp 'git cherry-pick'
abbr -a gd 'git diff'
abbr -a gdc 'git diff --cached'
abbr -a gds 'git diff --staged'
abbr -a gf 'git fetch'
abbr -a gl 'git pull'
abbr -a glo 'git log --oneline'
abbr -a gls 'git ls-files'
abbr -a glsf 'git ls-files | grep'
abbr -a gm 'git merge'
abbr -a gp 'git push'
abbr -a gp! 'git push --set-upstream origin'
abbr -a gr 'git reset'
abbr -a grh 'git reset HEAD'
abbr -a grha 'git reset --hard'
abbr -a grhh 'git reset HEAD --hard'
abbr -a grm 'git remote -v'
abbr -a grt 'cd (git rev-parse --show-toplevel; or echo ".")'
abbr -a gs 'git status'
abbr -a gst 'git stash'
abbr -a gstd 'git stash drop'
abbr -a gstp 'git stash pop'
abbr -a gsts 'git stash show --text'
abbr -a gwc 'git whatchanged -p --abbrev-commit --pretty=medium'
abbr -a m make
abbr -a mb 'make build'
abbr -a mbf 'make build-force'
abbr -a mc 'make clean'
abbr -a md 'make down'
abbr -a mdd 'make deploy'
abbr -a mi 'make init'
abbr -a mk 'make kill'
abbr -a ms 'make stop'
abbr -a mt 'make test'
abbr -a mu 'make up'
abbr -a p pdm
abbr -a pa 'pdm add'
abbr -a pc 'pdm sync'
abbr -a pi 'pdm install'
abbr -a pr 'pdm run'
abbr -a prl 'pdm run lvim'
abbr -a prp 'pdm run python'
abbr -a pu 'pdm update'
abbr -a publicipv4 'dig +short myip.opendns.com @resolver1.opendns.com'
abbr -a publicipv6 'dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'
abbr -a rm 'rm -iv'
abbr -a term 'kitty --single-instance & disown'
abbr -a v lvim
abbr -a vi lvim
abbr -a vim lvim
abbr -a weather 'curl -s "wttr.in/?format=%c+%l:+%C+%t+%w+%h" | sed "s/,.*:/:/g" | sed "s/  / /g" > ~/.config/weather'
abbr -a x 'xsel --clipboard'
abbr -a y yarn
abbr -a yb 'yarn build'
