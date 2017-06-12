#!/bin/bash
# functions.sh: common functions that can be used by all scripts

# to allow breaking up output into sections for travis view
# https://www.koszek.com/blog/2016/07/25/dealing-with-large-jobs-on-travis/
# example: travis_fold start foo; commands; travis_fold end foo
travis_fold() {
  local action=$1
  local name=$2
  echo -en "travis_fold:${action}:${name}\r"
}
