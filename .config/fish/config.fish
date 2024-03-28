set --export GPG_TTY (tty)
set --export PATH $PATH $HOME/.local/bin $HOME/.cargo/bin

set -U --export BROWSER firefox
set -U --export EDITOR nvim
set -U --export GLFW_IM_MODULE ibus
set -U --export XDG_CACHE_HOME $HOME/.cache
set -U --export XDG_CONFIG_HOME $HOME/.config
set -U --export XDG_DATA_HOME $HOME/.local/share
set -U --export XDG_STATE_HOME $HOME/.local/state
set -U --export fish_greeting ""

abbr -a cp 'cp -i'
abbr -a dcl 'docker container ls'
abbr -a de 'docker exec -it'
abbr -a df 'df -h'
abbr -a di 'docker inspect'
abbr -a dil 'docker image ls'
abbr -a dl 'docker logs'
abbr -a dp 'docker ps'
abbr -a dpa 'docker ps --all'
abbr -a dprod 'doppler setup -c prd --no-read-env --no-interactive'
abbr -a dr 'doppler run --'
abbr -a drpi 'doppler run -- pdm install'
abbr -a drpr 'doppler run -- pdm run'
abbr -a drps 'doppler run -- pdm sync'
abbr -a drpu 'doppler run -- pdm update'
abbr -a dry 'doppler run -- yarn'
abbr -a dryb 'doppler run -- yarn build'
abbr -a ds 'doppler setup'
abbr -a dsl 'docker service ls'
abbr -a dss 'doppler setup --no-read-env --no-interactive'
abbr -a du 'du -h'
abbr -a fbt 'doppler run -- pdm run fbt'
abbr -a ga 'git add'
abbr -a gaf 'git add -f'
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
abbr -a gdi 'git diff --ignore-blank-lines'
abbr -a gds 'git diff --staged'
abbr -a gf 'git fetch'
abbr -a gl 'git pull'
abbr -a glo 'git log --oneline'
abbr -a gls 'git ls-files'
abbr -a glsf 'git ls-files | grep'
abbr -a gm 'git merge'
abbr -a gp 'git push'
abbr -a gp! 'git push --set-upstream origin'
abbr -a gpc 'gopass show -c'
abbr -a gpgc 'gopass generate -c'
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
abbr -a mj 'make -j'
abbr -a pa 'pdm add'
abbr -a pc 'pdm sync'
abbr -a pi 'pdm install'
abbr -a pr 'pdm run'
abbr -a prl 'pdm run $EDITOR'
abbr -a prp 'pdm run python'
abbr -a pu 'pdm update'
abbr -a rm 'rm -iv'
abbr -a ssh 'kitty +kitten ssh'
abbr -a term 'kitty --single-instance & disown'

abbr -a x 'xsel --clipboard'
abbr -a w wl-copy

abbr -a v '$EDITOR'
abbr -a vi '$EDITOR'
abbr -a vim '$EDITOR'
abbr -a vmi '$EDITOR'
abbr -a nivm '$EDITOR'

abbr -a cat bat
abbr -a ls eza
abbr -a sl eza
abbr -a exa eza
abbr -a ll 'eza -la --header --git --git-repos --smart-group --icons=auto'

abbr -a boxdraw 'curl https://www.cl.cam.ac.uk/~mgk25/ucs/examples/UTF-8-demo.txt'
abbr -a publicipv4 'dig +short myip.opendns.com @resolver1.opendns.com'
abbr -a publicipv6 'dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'
abbr -a weather 'curl -s "wttr.in/?format=%c+%l:+%C+%t+%w+%h" | sed "s/,.*:/:/g" | sed "s/  / /g"' # > ~/.config/weather'

abbr -a pacclean 'pacman -Qtdq | paru -Rcns -'
abbr -a packages 'pacman -Qqnett'
abbr -a extpackages 'pacman -Qqmett'
abbr -a config '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
abbr -a nvimconf '$EDITOR ~/.config/nvim/lua/*/*.lua'
abbr -a fishconf '$EDITOR ~/.config/fish/config.fish'
abbr -a termconf '$EDITOR ~/.config/kitty/kitty.conf'
abbr -a i3conf '$EDITOR ~/.config/i3/config ~/.config/i3status/config ~/.config/i3status-rust/config.toml'
abbr -a hyprconf '$EDITOR ~/.config/hypr/hyprland.conf ~/.config/waybar/config ~/.config/waybar/style.css'

starship init fish | source
mise activate fish | source
