if [[ ! -o interactive ]]; then
    return
fi

compctl -K _clp clp

_clp() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(clp commands)"
  else
    completions="$(clp completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
