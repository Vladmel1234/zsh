#!/bin/zsh

# -------------------------------------------------------------------------------------------------------------------------------------
# Oh-My-Zsh
# -------------------------------------------------------------------------------------------------------------------------------------
ZSH=$HOME/.zsh/lib/oh-my-zsh        ## Path to your oh-my-zsh configuration.
plugins=(
  # chruby                          ## Change ruby environment autocomplete. Requires chruby.
  colored-man                       ## Colorize man pages.
  colorize                          ## Highligt file content based on file extension. Requires python-pygments.
  command-not-found                 ## Suggest a package to install if the command is not found.
  # common-aliases                  ## Add aliases for common tasks.
  compleat                          ## Generate command-line completions using a simple DSL.
  dirhistory                        ## Use Alt+left/right-arrow to cd through recently visited folders.
  docker                            ## Docker autocompletes.
  emacs                             ## Use emacs daemon capability.
  # extract                         ## Easily extract compressed files.
  git                               ## Adds several git aliases and increase the completion function provided by zsh.
  # git-extras                      ## Completion script for git-extras.
  # git-flow                        ## Achieve git-flow completion nirvana. Requires git-flow.
  # gpg-agent                       ## Start a gpg-agent on startup (?).
  history-substring-search          ## Write a string and use up/down-arrows to search it through history.
  iwhois                            ## Provide a whois command with a more accurate and up to date list of whois.
  knife                             ## Autocomplete for knife command.
  # rsync                           ## Rsync aliases.
  # ssh-agent                       ## SSH agent forwarding support.
  sublime                           ## Sublime Text 2 Aliases.
  systemadmin                       ## System administrator utils.
  # tmuxinator                      ## Tmuxinator autocomplete.
  # torrent                         ## Get a torrent using a magnet link.
  vagrant                           ## Vagrat autocomplete.
  web-search                        ## Search a string in one of the search-engines.
)
DISABLE_AUTO_UPDATE="true"          ## Disable annoying weekly auto-update checks
COMPLETION_WAITING_DOTS="true"      ## Red dots to be displayed while waiting for completion
source $ZSH/oh-my-zsh.sh            ## Source it, duh.

# colemak colored-man colorize

# -------------------------------------------------------------------------------------------------------------------------------------
# Plugins
# -------------------------------------------------------------------------------------------------------------------------------------
source $HOME/.zsh/lib/syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/lib/clipboard/zsh-clipboard.zsh
source $HOME/.zsh/lib/prompt/prompt-setup-old
source $HOME/.zsh/lib/zaw/zaw.zsh
source $HOME/.zsh/lib/bd/bd.zsh
#source $HOME/.zsh/lib/liquidprompt/liquidprompt

# Tmux powerline
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Midnight commander
export MC_SKIN=$HOME/.mc/lib/solarized/solarized.ini
export MC_KEYMAP=$HOME/.mc/config/etc/mc.keymap

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] &&
  source "$HOME/.rvm/scripts/rvm"
export RI="--format ansi --width 70"

# -------------------------------------------------------------------------------------------------------------------------------------
# History
# -------------------------------------------------------------------------------------------------------------------------------------
HISTFILE=$HOME/.zsh_history    # Enable history saving on shell exit
setopt APPEND_HISTORY          # Append rather than overwrite history file.
HISTSIZE=2200                  # Lines of history to maintain memory
SAVEHIST=2000                  # Lines of history to maintain in history file.
setopt HIST_SAVE_NO_DUPS       # Don't bother saving duplicates.
setopt HIST_IGNORE_ALL_DUPS    # Don't bother saving duplicates.
setopt HIST_IGNORE_SPACE       # Don't save commands with leading spaces.
setopt HIST_REDUCE_BLANKS      # Remove unnecessary blanks from command.

# -------------------------------------------------------------------------------------------------------------------------------------
# Shell Configuration
# -------------------------------------------------------------------------------------------------------------------------------------
# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# 256 bit colors (primarily for midnight commander)
# Find all possible options with `find /lib/terminfo /usr/share/terminfo -name "*256*"`
export TERM=xterm-256color
export XTERM=xterm-256color
export XDG_CONFIG_HOME=$HOME/.config

## Export basic editor
export EDITOR="subl -n"

# -------------------------------------------------------------------------------------------------------------------------------------
# Paths for zsh
# -------------------------------------------------------------------------------------------------------------------------------------
# Zsh Configuration Files
for configFile in $HOME/.zsh/config/*; do
  [ -r "$configFile" ] &&
    source "$configFile"
done
unset configFile

# Dotfiles Binaries
for evnBin in `cat $HOME/.gitslave | awk {'print $2'} | tr -d '"'`; do
  [[ -d $evnBin/bin ]] &&
    PATH=${PATH}:$HOME/${evnBin}/bin
done
PATH=${PATH}:$HOME/.local.d/bin
unset evnBin

# Zsh Scripts Binaries
PATH=${PATH}:$(find $HOME/.zsh/scripts -type d | tr '\n' ':' | sed 's/:$//')
export PATH              ## Export it, duh.
typeset -U path          ## Only unique entries please.

# -------------------------------------------------------------------------------------------------------------------------------------
# Aliases
# -------------------------------------------------------------------------------------------------------------------------------------
for aliasPath in `find $HOME/.zsh/scripts -type d`; do
  aliasName=`echo $aliasPath | awk -F/ '{print $NF}'`
  [[ -f ${aliasPath}/${aliasName} ]] &&
    alias ${aliasName}=${aliasPath}/${aliasName}
done
unset aliasPath
