# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
SLOT="0"

KEYWORDS="~amd64 ~ppc ~x86"
RESTRICT="mirror"

USE_MYAPP="myapp1-13 myapp1-12"

inherit myapp

IUSE="$(myapp_expand ${USE_MYAPP}) myapp"

SRC_URI=""
S="${WORKDIR}"

LICENSE="GPLv2"

HOMEPAGE="https://github.com/EinstokFair/einflay"
DESCRIPTION="Plugin for myapp"

RDEPEND="
"
DEPEND="
"

src_prepare() {
	eapply_user
}

src_compile() {
	:;
}

src_install() {
	if use myapp; then
	    local mytargets=( ${USE_MYAPP} )
	    for mytarget in ${mytargets[@]}; do
		local long_use_name="$( myapp_expand ${mytarget} )"
		einfo ${long_use_name}
		if use ${long_use_name}; then
		        einfo installing for ${mytarget}
                fi
	    done
	fi 
}
