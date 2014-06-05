#!/bin/sh

# FIXME: Change 'Your xxx' and remove '#'
#git config --global user.name "Your name"
#git config --global user.email "Your email"

git config --global core.editor 'vim -c "set fenc=utf-8"'
git config --global core.excludesfile "~/.gitignore"
git config --global push.default simple
git config --global color.ui true
