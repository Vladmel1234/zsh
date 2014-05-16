if [[ ! -o interactive ]]; then
    return
fi

compctl -K _chmod chmod

_chmod() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(chmod commands)"
  else
    completions="$(chmod completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
