# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: myapp-core.eclass
# @MAINTAINER: EinstokFair@users.noreply.github.com 
# @BLURB: directories for myapp application
# @DESCRIPTION: contain paths in the file system

case ${EAPI:-0} in
	0) die "this eclass doesn't support EAPI 0" ;;
	1|2|3) ;;
	*) ;; #if [[ ${USE_MYAPP} ]]; then REQUIRED_USE="|| (${USE_MYAPP})"; fi;;
esac

# @FUNCTION: my_app_path
# @DESCRIPTION: location (directory) for application blob
my_app_path () {
	echo "/usr/share/${PN}/${SLOT}"
}
