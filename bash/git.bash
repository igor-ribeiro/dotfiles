alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log"
alias gr="git restore"
alias gw="git worktree"
alias gwa="git worktree add"
alias gs="git switch"

function gco () {
	git checkout $@
}

# git push origin CURRENT_BRANCH
function ggp () {
  git push origin $(current-git-branch) $@
}

# git push origin CURRENT_BRANCH --force-with-lease
function ggpf () {
  git push origin $(current-git-branch) --force-with-lease $@
}

# git pull origin CURRENT_BRANCH
function ggl () {
  git pull origin $(current-git-branch)
}

function gm () {
  git merge --no-ff origin/$@
}

function g-set-up () {
  branch=$(current-git-branch)

  git branch --set-upstream-to=origin/$branch $branch
}

# Check if folder has .git
function has-git () {
  if [[ $(find . -maxdepth 1 -name '.git') ]]; then
    true
  else
    false
  fi
}

# Get git branch
function current-git-branch () {
  if ! has-git; then
    return
  fi

  git branch 2>/dev/null | grep '^*' | colrm 1 2
}


function get-git-untracked-count () {
  echo $(gst -s | grep -e '^[ ?]' | wc -l)
}

function get-git-tracked-count () {
  echo $(gst -s | grep --invert-match '^ ' | grep --invert-match '^?' | wc -l)
}

function get-git-behind-commits () {
  echo $(gst -b | grep -P 'is behind' | grep -oP '(\d)+ commit' | grep -oP '\d+')
}

function get-git-ahead-commits () {
  echo $(gst -b | grep -P 'is ahead' | grep -oP '(\d)+ commit' | grep -oP '\d+')
}

function git-reset () {
  branch=$1
  flags=$2

  if [ "$branch" = "" ]
  then
    echo "Branch is required: git-reset <branch>";
    return
  fi

  git fetch origin $branch
  git reset origin/$branch $2
}

function git-rebase () {
  branch=$1

  if [ "$branch" = "" ]; then
    echo "Branch is required: git-rebase <branch>";
    return
  fi

  git fetch origin $branch
  git rebase origin/$branch
}

