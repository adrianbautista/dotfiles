#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Inspired by https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
############################

########## Variables

DOTFILES_DIR="$HOME/dotfiles"                     # dotfiles directory
OLD_DOTFILES_DIR="$HOME/dotfiles_old"  # old dotfiles backup directory
CONFIG_FILES=`ls "$HOME/dotfiles/configuration_files"`     # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $OLD_DOTFILES_DIR for backup of any existing dotfiles in ~ ..."
mkdir -p $OLD_DOTFILES_DIR
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $DOTFILES_DIR directory ..."
cd $DOTFILES_DIR
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for FILE in $CONFIG_FILES; do
  echo "Moving old $FILE from ~ to $OLD_DOTFILES_DIR"
  mv ~/.$FILE $OLD_DOTFILES_DIR/
  echo "Creating symlink to $FILE in home directory."
  ln -s $DOTFILES_DIR/configuration_files/$FILE ~/.$FILE
done

# create .user_variables and .user_gitconfig file
echo "Creating .user_variables in $DOTFILES_DIR"
touch $DOTFILES_DIR/.user_variables
echo "Creating .user_gitconfig in $DOTFILES_DIR"
touch $DOTFILES_DIR/.user_gitconfig

# install Vim Plug if not present already
if [[ ! -d "$HOME/.vim/autoload/plug.vim" ]]; then
  echo "Installing Vim Plug to ~/.vim/autoload/plug.vim for plugin support"

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo "Configuration done. Boom."
echo "Now set a terminal and shell color scheme with: base16_THEME_NAME"
echo "And install plugins in vim by running: :PlugInstall"

