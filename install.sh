
#!/usr/bin/env bash
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"
function ok() {
    echo "$COL_GREEN[ok]$COL_RESET "$1
}

function bot() {
    echo "\n$COL_GREEN\[._.]/$COL_RESET - "$1
}

function running() {
    echo "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function action() {
    echo "\n$COL_YELLOW[action]:$COL_RESET\n ⇒ $1..."
}

function warn() {
    echo "$COL_YELLOW[warning]$COL_RESET "$1
}

function error() {
    echo "$COL_RED[error]$COL_RESET "$1
}

echo "Preparing laptop with your favorite stuff...\n"

#dotfiles
files=".gitconfig .gitignore .zshrc"

now=$(date +"%Y-%m-%d-%H:%M:%S")

for file in $files; do
  running "~/$file"
  # if the file exists:
  if [[ -e ~/$file ]]; then
      mkdir -p ~/.dotfiles_backup/$now
      mv ~/$file ~/.dotfiles_backup/$now/$file
      echo "backup saved as ~/.dotfiles_backup/$now/$file"
  fi
  # symlink might still exist
  unlink ~/$file > /dev/null 2>&1
  # create the link
  ln -s ~/.dotfiles/files/$file ~/$file
  echo '\tlinked';ok
done



#vscode
( "./software.sh" )
( "VSCode/install.sh" )