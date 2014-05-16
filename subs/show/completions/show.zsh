if [[ ! -o interactive ]]; then
    return
fi

compctl -K _show show

_show() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(show commands)"
  else
    completions="$(show completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
