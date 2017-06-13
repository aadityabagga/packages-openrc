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

# in case of no output for 10 minutes, travis will terminate the job
# to avoid that, using travis_wait
# https://docs.travis-ci.com/user/common-build-problems/#My-builds-are-timing-out
# this is because we are writing to log file while building to avoid travis log limit
# https://github.com/travis-ci/travis-ci/issues/1382
run_with_travis_wait() {
	travis_wait 30 "$@"
}

# vim:set ts=2 sw=2 et:
