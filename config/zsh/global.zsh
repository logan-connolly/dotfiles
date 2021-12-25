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

tml() {
  local -r fmt='#{session_id}:|#S|(#{session_attached} attached)'
  { tmux display-message -p -F "$fmt" && tmux list-sessions -F "$fmt"; } \
    | awk '!seen[$1]++' \
    | column -t -s'|' \
    | fzf -q '$' --reverse --prompt 'switch session: ' -1 \
    | cut -d':' -f1 \
    | xargs tmux switch-client -t
}
