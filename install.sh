#!/bin/bash

for f in _*; do
  ln -sf "$(pwd)/$f" "$HOME/${f/_/.}"
done

BIN_DIR=$HOME/bin
mkdir -p $BIN_DIR
ln -sf "$(pwd)/install-ruby.sh" $BIN_DIR

if [ -d $RBENV_ROOT ]
then
  ln -sf "$(pwd)/default-gems" $RBENV_ROOT
fi

NEOVIM_DIR=$HOME/.config/nvim
mkdir -p $NEOVIM_DIR
ln -sf "$(pwd)/nvim/init.vim" $NEOVIM_DIR
ln -sf "$(pwd)/nvim/plugins.toml" $NEOVIM_DIR
