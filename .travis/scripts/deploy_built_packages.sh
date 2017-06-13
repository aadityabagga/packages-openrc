#!/bin/bash
# deploy_built_packages.sh: to deploy built packages
# NOTE: uses encrypted variables

PKG_LOCATION="$HOME/manjaro-chroot/var/cache/manjaro-tools/pkg/unstable/x86_64/"
SFREPO="frs.sourceforge.net:/home/frs/project/mefiles/Manjaro/test/packages-openrc/x86_64/"

if [ ! -f "${HOME}/.ssh/id_rsa" ];
	# cant deploy without key
	echo "deployment key not found"
	exit 1
fi

if [ "$(ls -1 ${PKG_LOCATION} | wc -l)" -gt 0 ]; then
	# upload to tmp repo for testing
	rsync -auvLPH --delete-after "${PKG_LOCATION}" "${SFUSER}"@"${SFREPO}"
fi
