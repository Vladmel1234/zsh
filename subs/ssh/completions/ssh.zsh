if [[ ! -o interactive ]]; then
    return
fi

compctl -K _ssh ssh

_ssh() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(ssh commands)"
  else
    completions="$(ssh completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
