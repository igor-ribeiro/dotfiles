alias dcudebug="docker-compose -f docker-compose.yml -f docker-compose.debug.yml up"
alias dcud="docker-compose up -d && docker-compose logs -f"
alias dcl="docker-compose logs -f"
alias dcd="docker-compose down"

function dcu () {
  docker_compose="$(docker-compose config)"
  container_name="$(echo $docker_compose | grep -oEi 'container_name: ([a-z_]+)' | sed -E 's/(container_name: )//' | grep '_web')"
  name="$container_name"
  running_id=$(docker ps -a -f "name=$name" -q)
  branch=""

  if [[ $1 != "--no-branch" ]]; then
    branch="_$(current-git-branch)"
    name+=$branch
  fi

  if [ "$name" != "" ]; then
    echo "Stopping $name"
    docker stop $name || true
    docker rm $name || true
  fi

  BRANCH=$branch docker-compose -p $name up --force-recreate -d
  docker-compose -p $name logs -f
}

function docker-ls () {
  docker ps -a -f "name=$name" -q
}

function docker-stop-all () {
  docker-ls | xargs docker stop
}
