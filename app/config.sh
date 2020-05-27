#!/bin/sh +x
function dev() {
  yarn install && yarn dev
}

function ci() {
  yarn install && yarn build
}

main="${1:-dev}"
$main
