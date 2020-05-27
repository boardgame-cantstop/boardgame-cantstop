#!/bin/sh +x
function dev() {
  yarn install && yarn dev
}

function ci() {
  which jq || apk update && apk add jq
  yarn install && yarn build
  sed "s|@VERSION@|$(cat package.json|jq -r .version)|g" -i build/index.html
  sed "s|@BUILD@|$1|g" -i build/index.html
}

main="${1:-dev}"
build="${2:-SNAPSHOT}"
$main $build
