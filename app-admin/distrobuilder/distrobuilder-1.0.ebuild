# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="System container image builder for LXC and LXD"
HOMEPAGE="https://linuxcontainers.org/distrobuilder/introduction/"
LICENSE="Apache-2.0"
SLOT="0"

RESTRICT="mirror"
EGIT_COMMIT="f6b2a160a7e3e5e9d3c5767cf07c8cd03a3eca1d"
SRC_URI="https://github.com/lxc/distrobuilder/archive/${EGIT_COMMIT}.tar.gz -> ${CATEGORY}-${PN}-${PV}.tar.gz"
S="${WORKDIR}/${PN}-${EGIT_COMMIT}"
KEYWORDS="~amd64"

BDEPEND="
	dev-lang/go
	dev-util/debootstrap
	net-misc/rsync
	app-crypt/gnupg
	sys-fs/squashfs-tools
	dev-vcs/git
"
DEPEND="
"

src_prepare() {
	default
}

src_compile() {
	make || die "make failed"
}

src_install() {
	:;
}
