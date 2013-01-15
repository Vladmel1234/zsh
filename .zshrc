#######################################################################################################################################
# Oh-My-Zsh
#######################################################################################################################################
ZSH=$HOME/.zsh/lib/oh-my-zsh                           		## Path to your oh-my-zsh configuration.
source $ZSH/oh-my-zsh.sh                                    ## Source it, duh.
DISABLE_AUTO_UPDATE="true"                          		## Disable annoying weekly auto-update checks
COMPLETION_WAITING_DOTS="true"                      		## Red dots to be displayed while waiting for completion
plugins=(command-not-found compleat extract gem git git-flow history-substring-search lol perl ssh-agent sublime)

#######################################################################################################################################
# Plugins
#######################################################################################################################################
source $HOME/.zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/lib/zsh-clipboard/zsh-clipboard.zsh

# Git Prompt -- https://github.com/jcorbin/zsh-git/blob/master/zshrc
setopt promptsubst
autoload -U promptinit
promptinit
prompt wunjo

# Tmux powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

#######################################################################################################################################
# Shell Configuration
#######################################################################################################################################
# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# 256 bit colors (primarily for midnight commander)
# Find all possible options with `find /lib/terminfo /usr/share/terminfo -name "*256*"`
export TERM=xterm-256color
export XTERM=xterm-256color
export XDG_CONFIG_HOME=~/.config

## Export basic editor
export EDITOR="sublime-text-2"

#######################################################################################################################################
# Paths for zsh
#######################################################################################################################################
# Zsh Configurations
for file in ~/.zsh/config/*; do
  [ -r "$file" ] && source "$file"
done
unset file

# Path to search for autoloadable functions.
fpath=( $HOME/.zsh/cofig/functions "$fpath[@]" )
export FPATH             ## Export it, duh.
typeset -U fpath         ## Only unique entries please.

# Path to binary files.
envBins="tmux mc local slmenu gitl"
for evnBin in $envBins; do
	NewPath=`find $HOME -d | grep "${evnBin}/bin$"`
	[[ -z `echo $PATH | grep $NewPath` ]] && PATH=$PATH:$NewPath
done
unset evnBin
export PATH              ## Export it, duh.
typeset -U path          ## Only unique entries please.
rationalize-path path    ## Sanity Check