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
# using a workaround that echos something to the log
# https://stackoverflow.com/questions/26082444/how-to-work-around-travis-cis-4mb-output-limit/26082445#26082445
travis_ping() {
  local operation=$1
  local item=$2
  if [ "$operation" = start ]; then
    bash -c "while true; do echo \$(date) - building $item...; sleep 60s; done" &
    export PING_LOOP_PID=$!
  elif [ "$operation" = stop ]; then
    kill $PING_LOOP_PID
  fi
}

# functions adapted from https://github.com/mikkeloscar/arch-travis/blob/master/arch-travis.sh
# read value from .travis.yml
travis_yml() {
  ruby -ryaml -e 'puts ARGV[1..-1].inject(YAML.load(File.read(ARGV[0]))) {|acc, key| acc[key] }' .travis.yml $@
}

# set config variables
read_config() {
  local old_ifs=$IFS
  IFS=$'\n'
  CONFIG_REPOS=($(travis_yml arch repos))
  IFS=$old_ifs
}

# add custom repositories to pacman.conf
add_repositories() {
  local arch_chroot=$1
  for repo in "${CONFIG_REPOS[@]}"; do
    local splitarr=(${repo//=/ })
    echo "[${splitarr[0]}]" | sudo tee "$arch_chroot/etc/pacman.conf"
    echo "Server = ${splitarr[1]}" | sudo tee "$arch_chroot/etc/pacman.conf"
    echo "" | sudo tee "$arch_chroot/etc/pacman.conf"
  done
}

# vim:set ts=2 sw=2 et:
