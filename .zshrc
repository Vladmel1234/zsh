# Oh-my-zsh thingies
	ZSH=$HOME/.zsh/lib/oh-my-zsh                           		# Path to your oh-my-zsh configuration.
	plugins=(command-not-found compleat extract gem git git-flow history-substring-search lol perl ssh-agent sublime)
	source $ZSH/oh-my-zsh.sh
	DISABLE_AUTO_UPDATE="true"                          		# Disable annoying weekly auto-update checks
	COMPLETION_WAITING_DOTS="true"                      		# Red dots to be displayed while waiting for completion
	set -o notify 												# notify of bg job completion immediately

# Load zsh essentials
	for file in ~/.zsh/config/*; do
	  [ -r "$file" ] && source "$file"
	done
	unset file

# Prefer US English and use UTF-8
	export LC_ALL="en_US.UTF-8"
	export LANG="en_US"

# Customize to your needs...
	export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$HOME/git/scripts:$HOME/.local/bin:$HOME/git/bin

# Git Prompt -- https://github.com/jcorbin/zsh-git/blob/master/zshrc
	setopt promptsubst
	autoload -U promptinit
	promptinit
	prompt wunjo

# 256 bit colors (primarily for midnight commander)
# Find all possible options with `find /lib/terminfo /usr/share/terminfo -name "*256*"`
	export TERM=xterm-256color
	export XTERM=xterm-256color
	export XDG_CONFIG_HOME=~/.config

# Export defaults
	export EDITOR="sublime-text-2"

# Thingies of tmux powerline
	PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

# Initialize plugins
	source $HOME/.zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source $HOME/.zsh/lib/zsh-clipboard/zsh-clipboard.zsh