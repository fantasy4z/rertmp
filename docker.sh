#!/bin/bash

IMAGE_NAME="fantasy4z/rertmp"
CONTAINER_NAME="rertmp_container"
WORK_DIR="/rertmp"

main()
{
  local cmd=$1

  case $cmd in
    "build")
      docker build -t "${IMAGE_NAME}" -f ./Dockerfile .
      ;;
    "run")
      docker run -d --name "${CONTAINER_NAME}" -v `pwd`:${WORK_DIR} -p 1936:1935 "${IMAGE_NAME}"
      ;;
    "stop")
      docker stop "${CONTAINER_NAME}"
      docker rm "${CONTAINER_NAME}"
      ;;
    *)
      echo "Unknown command: ${cmd}"
      exit 1
      ;;
  esac
}

main "$@"
