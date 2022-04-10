#!/bin/bash
GITARGS="--git-dir=./nvim/.git --work-tree=./nvim"
BRANCH="main"

git init ./nvim
git $GITARGS remote add origin git@github.com:NvChad/NvChad.git
git $GITARGS fetch
git $GITARGS reset --hard origin/$BRANCH
git $GITARGS checkout $BRANCH

nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
