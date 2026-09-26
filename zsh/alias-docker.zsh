# -*- mode: sh -*-

# helpers: bulk operations. they hit every container, so each one shows what it
# will touch and waits for confirmation. non-interactive shells always abort.
docker_confirm() {
  local prompt=$1 names=$2
  if [[ ! -o interactive ]]; then
    echo "refusing $prompt in a non-interactive shell" >&2
    return 1
  fi
  print -l "$names" | sed 's/^/  /'
  local reply
  read -q "reply?$prompt the containers above? [y/N] " || { echo; return 1 }
  echo
}

docker_stop_all() {
  local ids=$(docker ps -q)
  [[ -z $ids ]] && return 0
  docker_confirm stop "$(docker ps --format '{{.Names}}')" || return 0
  docker stop ${=ids}
}

docker_remove_all() {
  local ids=$(docker ps -aq)
  [[ -z $ids ]] && return 0
  docker_confirm "remove (and stop)" "$(docker ps -a --format '{{.Names}}')" || return 0
  docker rm -f ${=ids}
}

docker_remove_exited() {
  local ids=$(docker ps -aq --filter status=exited)
  [[ -z $ids ]] && return 0
  docker_confirm remove "$(docker ps -a --filter status=exited --format '{{.Names}}')" || return 0
  docker rm ${=ids}
}

# shell into a running container by name fragment, bash with sh fallback
docker_shell() {
  local id=$(docker ps -qf "name=$1")
  if [[ -z $id ]]; then
    echo "no running container matching: $1" >&2
    return 1
  fi
  # probe rather than `bash || sh`: that falls through whenever bash exits non-zero
  local shell=sh
  docker exec $id sh -c 'command -v bash' &>/dev/null && shell=bash
  docker exec -it $id $shell
}

# containers
alias dp='docker ps --format="table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'
alias dpa='dp -a'
alias dl='docker ps -l -q'
alias dstop='docker_stop_all'
alias drm='docker_remove_all'
alias drsc='docker_remove_exited'
alias dbash='docker_shell'
alias dex='docker exec -it'
alias dlog='docker logs -f'
alias dstats='docker stats --no-stream'
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# images
alias di='docker images'
alias dri='docker rmi'
alias dbu='docker build -t'

# run
alias dkd='docker run -d -P'
alias dki='docker run -it -P'
alias drit='docker run --rm -it'

# compose
alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcb='docker compose build'
alias dcl='docker compose logs -f'
alias dcp='docker compose ps'

# cleanup
alias dprune='docker system prune'
alias dclean='docker_remove_all && docker image prune'

# list every docker alias
alias dalias="alias | grep -E \"^d[a-z]*='?docker\" | sed 's/=/ => /' | sort"
