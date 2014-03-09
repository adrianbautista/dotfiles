# Append Homebrew path before system bin
[[ -s "$HOME/.bash_path" ]] && source "$HOME/.bash_path"

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# This loads NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# Load environment variables for development
[[ -s "$HOME/.environment_variables" ]] && source "$HOME/.environment_variables"

# Load terminal prompt scripts
[[ -s "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"

# Load aliases
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Use Homebrew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
