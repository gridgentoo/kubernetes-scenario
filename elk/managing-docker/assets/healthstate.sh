#!/bin/bash
CONTAINERNAME=$1
while [ "$CONTAINERSTATE" != healthy ]; do
  CONTAINERSTATE=$(docker inspect $CONTAINERNAME | jq -r ".[].State.Health.Status")
  echo "$CONTAINERNAME is $CONTAINERSTATE"
  sleep 5
done
