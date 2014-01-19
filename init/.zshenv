#!/bin/zsh

# -------------------------------------------------------------------------------------------------------------------------------------
# Enable shell prompt
# -------------------------------------------------------------------------------------------------------------------------------------
	fpath=($fpath $HOME/.zsh/lib/zsh-prompt)
	typeset -U fpath
# Add zsh completions
	fpath=($fpath $HOME/.zsh/lib/zsh-completions/src)
	#fpath=($fpath $HOME/.zsh/completions)