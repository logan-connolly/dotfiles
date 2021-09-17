nnn_cd() {
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  nnn "$@"
  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}

git_current_branch() {
  git -C "$1" branch | sed '/^\*/!d;s/\* //'
}

tmux_sessionizer() {
  if [[ $# -eq 1 ]]; then
    selected=$1
  else
    selected=$(find $HOME/projects -mindepth 1 -maxdepth 1 -type d | fzf)
  fi

  if [[ -z $selected ]]; then
    exit 0
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)
  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
  fi

  if ! tmux has-session -t $selected_name 2>/dev/null; then
    tmux new-session -ds $selected_name -c $selected
  fi

  if [[ -z $TMUX ]]; then
    tmux attach-session -t $selected_name
  else
    tmux switch-client -t $selected_name
  fi
}
