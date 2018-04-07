#!/usr/bin/env bash
DIR="${BASH_SOURCE%/*}"


# settings
ln -s $HOME/.dotfiles/VSCode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

# extensions
source "$DIR/vscode-extensions.sh"