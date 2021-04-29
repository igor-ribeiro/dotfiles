function open-tomato () {
  work_time=15
  break_time=5

  if [[ $1 != "" ]]; then
    work_time=$1
  fi

  if [[ $2 != "" ]]; then
    work_time=$2
  fi

  tmux split-window -l 6 ~/code/ribeiro/tomato/target/release/tomato $work_time $break_time
  tmux select-pane -l
}
