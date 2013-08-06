# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
# https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized
# http://geoff.greer.fm/lscolors/


# terminal coloring
txtblk='\[\e[0;30m\]' # Black
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
txtrst='\[\e[0m\]'    # Text Reset

PATH=/usr/local/heroku/bin:/usr/local/git/bin:$HOME/.rvm/bin:$HOME/Documents/scripts:$PATH

HISTFILESIZE=9000

# environment variables
# export VARIABLE=key

source ~/.rvm/scripts/rvm
source ~/git-completion.bash
source ~/.bashrc

# aliases
alias ll='ls -al'
alias l='ls -a'
alias b='cd ..'
alias work='cd ~/Workspace'
alias a='alias'
alias r='rails console'
alias db='rails db'
alias p='pry'
alias git='hub'
alias g='hub'
alias h='history'
alias o="open"
alias oo="open ."
alias be='bundle exec'
alias ij='open -a /Applications/IntelliJ\ IDEA\ 12\ CE.app'

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

function branch
{
  git status 2> /dev/null | ruby ~/Documents/scripts/branch.rb
}

# terminal prompt
echo "----------------------------------------------------------------"
echo "$(git --version)"
echo "$(ruby -v)"
echo "$(rails -v)"
echo "----------------------------------------------------------------"
PS1="$txtylw\w$txtgrn\$(branch)$txtred †$txtrst "