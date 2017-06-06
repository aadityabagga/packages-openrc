#!/bin/sh
#
# changed_packages.sh
# adapted from https://github.com/voidlinux/void-packages/blob/master/common/travis/changed_templates.sh

/bin/echo -e '\x1b[32mChanged packages:\x1b[0m \n'
git diff --name-only FETCH_HEAD...HEAD | grep "PKGBUILD$" | cut -d/ -f 1 | tee /tmp/packages_changed.txt
