# TMUX
# always start tmux :)
# https://unix.stackexchange.com/a/410528
# AUTO-TMUX
if [[ "$TERM" =~ "screen".* ]]; then
  echo "We are in TMUX!"
else
  echo "We are not in TMUX :/  Let's get in!"
  # Launches tmux in a session called 'base'.
  #tmux attach -t base || tmux new -s base
  tmux
fi


