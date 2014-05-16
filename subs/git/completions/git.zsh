if [[ ! -o interactive ]]; then
    return
fi

compctl -K _git git

_git() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(git commands)"
  else
    completions="$(git completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
