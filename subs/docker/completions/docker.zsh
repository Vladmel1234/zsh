if [[ ! -o interactive ]]; then
    return
fi

compctl -K _docker docker

_docker() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(docker commands)"
  else
    completions="$(docker completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
