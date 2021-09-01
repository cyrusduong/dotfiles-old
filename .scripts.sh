dbash() {
  docker exec -it "$1" /bin/bash
}

dstop() {
  docker stop $(docker ps | grep "$1" | awk '{print $1}')
}
