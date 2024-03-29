# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

MY_PN=cura

case "${PV}" in
	*_beta*) MY_PV="${PV/_beta/-beta.}" ;;
	*) MY_PV="${PV}"
esac

DESCRIPTION="3D printer / slicing GUI built on top of the Uranium framework"
HOMEPAGE="https://github.com/Ultimaker/Cura"

EGIT_COMMIT="5b6e9d1005888e29190170c4b870a7db1eeef579"
# https://github.com/Ultimaker/Cura/archive/refs/tags/5.6.0.tar.gz
SRC_URI="${HOMEPAGE}/archive/refs/tags/${MY_PV}.tar.gz -> ${CATEGORY}-${PN}-${PV}.tar.gz
	https://upload.wikimedia.org/wikipedia/commons/9/9a/Ultimaker_cura.png	-> ${P}-icon.png"
	#${HOMEPAGE}/blob/6f154ea44429491a66544f572135c50ecdab397a/resources/images/cura-icon.png?raw=true -> ${MY_PN}-icon.png"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RESTRICT="bindist mirror strip"

RDEPEND="sys-fs/fuse:0"

QA_PREBUILT="*"

src_install() {
	exeinto "/opt/${MY_PN}"
	doexe "${P}.AppImage"
	dosym "/opt/${MY_PN}/${P}.AppImage" "/usr/bin/${MY_PN}" || die "dosym failed"
	newicon -s 128 "${P}-icon.png" "${MY_PN}-icon.png" || die "doicon failed"
	domenu "${FILESDIR}/${MY_PN}.desktop"
}

