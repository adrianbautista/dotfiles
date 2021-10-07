### Dependencies

- [base16-shell](https://github.com/chriskempson/base16-shell) (included in repo as submodule)
- [Vim Plug](https://github.com/junegunn/vim-plug)
- [XVim2](https://github.com/XVimProject/XVim2) (included as submodule for XCode Vim keybindings)

# Usage

Clone the repo into your home directory:

```shell
cd ~
git clone --recurse-submodules https://github.com/adrianbautista/dotfiles.git
```

Then execute the symlink script from the new dotfiles directory:

```shell
cd ~/dotfiles
./setup.sh
```

Edit the content of `.user_variables` and `.user_gitconfig` in the dotfiles directory to store sensitive user variables and keys:

```shell
# EXAMPLE .user_variables
export KEY=value
```
```shell
# EXAMPLE .user_gitconfig
[user]
  name = "Your Name"
  email = user@email.com
```

---

If using homebrew on Mac OSX:

```shell
brew bundle --file=~/dotfiles/Brewfile
```
