if [[ ! -o interactive ]]; then
    return
fi

compctl -K _extract extract

_extract() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(extract commands)"
  else
    completions="$(extract completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
