# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
KEYWORDS="amd64"
SLOT="0"
RESTRICT="mirror test"

inherit desktop java-pkg-2 java-utils-2 java-ant-2

DESCRIPTION="Offline vector map display ported from OsmAnd"
HOMEPAGE="https://sourceforge.net/projects/offroadosm"
LICENSE="GPL-3"
SRC_URI=""

inherit vcs-snapshot

REPO_OWNER=Shushandr
REPO_NAME=offroad
EGIT_COMMIT=5cee1128268bcef77a3007616607728366078f04
SRC_URI="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/tarball/${EGIT_COMMIT} ->  ${CATEGORY}-${PN}-${PV}.tar.gz"
S="$WORKDIR/${CATEGORY}-${PN}-${PV}"


DEPEND=">=virtual/jdk-11"
RDEPEND=">=virtual/jre-11"
BDEPEND=""

src_compile() {
	eant || die
}

src_install() {
	java-pkg_dojar dist/lib/*
	java-pkg_jarinto /usr/share/${PN}
	java-pkg_dojar dist/OffRoad.jar
	java-pkg_dolauncher ${PN} --jar OffRoad.jar --pwd /usr/share/${PN}
	newicon res/offroad_icon.png ${PN}.png
	make_desktop_entry ${PN} "OffRoad" ${PN} "Utility;Science;Geoscience"
}
