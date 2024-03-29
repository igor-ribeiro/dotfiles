alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gcaa="git commit --amend --no-edit"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log"
alias gr="git restore"
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

function ggpff () {
  git push origin $(current-git-branch) --force $@
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

function g-set-remote () {
  project=$1
  branch=$(current-git-branch)

  if [ -z $1 ]; then
    echo -e "
ERROR: Missing project

USAGE:
  $> g-set-remote <owner/project>
"
  return 1
  fi

  git remote add origin git@github.com:$project.git
  git push --set-upstream origin $branch
}

function gw () {
	action=$1	
	i=0

	if [ "$action" = "remove" ]; then
		for branch in $@; do
			if [ $i -gt 0 ]; then
				git worktree remove $@
			fi
			((++i))
		done
  elif [ "${action}" = "add" ]; then
    args=${@:2}
    path="$2"

    if [[ -z $args ]]; then
      echo "USAGE: gw add [-b <branch>] <path> [<commmit>]"
      return 1
    fi

    if [ "${2}" = "-b" ]; then
      path="$3"

      if ! [[ -z "$5" ]]; then
        path="$4"
      fi

      # ${@:3} gets all arguments minus the first two
      git worktree add -b ${@:3}
      git push -u origin $3
    else
      git worktree $@
    fi

    common_dir=./worktree-common

    if [ "$path" = "" ]; then
      path="$4"
    fi

    if [ -d "$common_dir" ] && [ -d "$path" ]; then 
      cp -rT $common_dir ./$path
    fi

    cd $path
  else
		git worktree $@
	fi
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
    branch=$(current-git-branch)
    echo -e "Missing branch option, using $branch\n";
  fi

  git fetch origin $branch --tags
  git rebase origin/$branch $(current-git-branch) --reapply-cherry-picks
}

function ggrh () {
  git-reset $1 --hard
}

function ggb () {
  git-rebase $1
}

function git-find-stash () {
  if [ "$1" = "" ]; then
    echo "Missing search: git-find-stash <search>";
    return
  fi

  git fsck --unreachable | grep commit | cut -d" " -f3 | xargs git log --merges --no-walk --grep=$1
}

function git-stash-staged () {
  git stash push -- $(git diff --staged --name-only)
}

function git-wortree-add () {
  test="$?"
  echo $test
}
