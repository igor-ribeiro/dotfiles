function bash-status-git-branch () {
  if ! has-git; then
    return
  fi

  tracked_files=$(get-git-tracked-count)
  untracked_files=$(get-git-untracked-count)
  behind_commits=$(get-git-behind-commits)
  ahead_commits=$(get-git-ahead-commits)

  echo -n " on "

  if [[ $untracked_files != "0" ]]; then
    echo -ne "\e[38;5;203m"
  elif [[ $tracked_files != "0" ]]; then
    echo -ne "\e[38;5;184m"
  elif [[ $behind_commits ]]; then
    echo -ne "\e[94m"
  elif [[ $ahead_commits ]]; then
    echo -ne "\e[94m"
  else
    echo -ne "\e[92m"
  fi

  echo -ne "$(current-git-branch)\e[0m"
}

# Add visual if there are staged files
function bash-status-git-stage () {
  if ! has-git; then
    return
  fi

  untracked_files=$(get-git-untracked-count)
  tracked_files=$(get-git-tracked-count)
  behind_commits=$(get-git-behind-commits)
  ahead_commits=$(get-git-ahead-commits)

  if [[ $untracked_files != "0" ]]; then
    echo -ne "\e[38;5;203m ←$untracked_files\e[0m"
  fi

  if [[ $tracked_files != "0" ]]; then
    echo -ne "\e[38;5;184m →$tracked_files\e[0m"
  fi

  if [[ $behind_commits ]]; then
    echo -ne "\e[94m ↓$behind_commits\e[0m"
  fi

  if [[ $ahead_commits ]]; then
    echo -ne "\e[94m ↑$ahead_commits\e[0m"
  fi
}

function bash-status-last-directory () {
  echo -e "$(basename $(dirname $PWD))/$(basename $PWD)"
}

function get-bash-status () {
  current_dir="\[\e[2m\]\$(bash-status-last-directory)\[\e[0m\]"
  git_branch="\[\$(bash-status-git-branch)\]"
  git_status="\[\$(bash-status-git-stage)\]"

  echo -e "$current_dir$git_branch$git_status"
  echo -e "\[\e[2m\]$ \[\e[0m\]"
}

# Show the current folder, git branch and git stage info
export PS1=$(get-bash-status)
