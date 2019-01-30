# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
RESTRICT="mirror"
KEYWORDS="~amd64 ~x86 ~ppc"

inherit eapi7-ver 
SLOT="$(ver_cut 1-2)"

inherit myapp-core

IUSE="symlink debug"

SRC_URI=""

S="${WORKDIR}"

HOMEPAGE="https://github.com/EinstokFair/einflay"
DESCRIPTION="MyApplication for demonstrating packaging errors and failures"
LICENSE="GPLv2"

RDEPEND="
"
DEPEND="
"

src_prepare() {
	eapply_user
}

src_compile() {
	default
}

src_install() {
	if use symlink; then
			if use debug; then
				make_wrapper myapp "$(my_app_path) --debug"
			else
				make_wrapper myapp "$(my_app_path)"
			fi
	fi
}

pkg_postinst() {
	if ! has "myapp${SLOT/./-}" ${MYAPP_TARGETS}; then
		   elog "To install plugins for this version of myapp, you will need to"
		   elog "add myapp${SLOT/./-} to your MYAPP_TARGETS USE_EXPAND variable."
		   elog
	fi
}
