# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: myapp.eclass
# @MAINTAINER: EinstokFair@users.noreply.github.com 
# @BLURB: Provides common things for all plugins
# @DESCRIPTION: myapp_expand and inherits from myapp-core

case ${EAPI:-0} in
	0) die "this eclass doesn't support EAPI 0" ;;
	1|2|3) ;;
	*) ;; #if [[ ${USE_MYAPP} ]]; then REQUIRED_USE="|| (${USE_MYAPP})"; fi;;
esac

DEPEND+=" mycategory/myapp"

inherit myapp-core

# @FUNCTION: myapp_expand
# @DESCRIPTION: expands values from the MYAPP_TARGETS variable
myapp_expand() {
	local result=""
	for use_flag in $@; do
		result="${result} ${use_flag//myapp/myapp_targets_myapp}"
	done
	echo "${result}"
}
