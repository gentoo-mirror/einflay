# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="System container image builder for LXC and LXD"
HOMEPAGE="https://linuxcontainers.org/distrobuilder/introduction/"
LICENSE="Apache-2.0"
SLOT="0"

RESTRICT="mirror"
EGIT_COMMIT="e72a24977a47aba3168b65cdd2024fd583d2b2e6"
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
