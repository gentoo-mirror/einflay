# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools
inherit systemd vcs-snapshot
DESCRIPTION="FUSE filesystem for LXC"
HOMEPAGE="https://linuxcontainers.org/lxcfs/introduction/"
LICENSE="Apache-2.0"
SLOT="0"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/lxc/lxcfs.git"
	EGIT_BRANCH="master"
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
else
	RESTRICT="mirror"
	EGIT_COMMIT="584fdce8efeba3ed9416ce706d5a938b58f66103"
	SRC_URI="https://github.com/lxc/lxcfs/archive/${EGIT_COMMIT}.tar.gz -> ${CATEGORY}-${PN}-${PV}.tar.gz"
	S="${WORKDIR}/${CATEGORY}-${PN}-${PV}"
	KEYWORDS="~amd64"
fi

# Omit all dbus.  Upstream appears to require it because systemd, but
# lxcfs makes no direct use of dbus.
RDEPEND="
	dev-libs/glib:2
	sys-fs/fuse:0
"
DEPEND="
	sys-apps/help2man
	${RDEPEND}
"

src_prepare() {
	default
	eautoreconf
	./bootstrap.sh || die "Failed to bootstrap configure files"
}

src_configure() {
	# Without the localstatedir the filesystem isn't mounted correctly
	econf --localstatedir=/var
	eapply "${FILESDIR}/${PN}-fusermount-path-4.patch"
}

src_install() {
	default
	keepdir /var/lib/lxcfs
	newinitd "${FILESDIR}"/${PN}.initd lxcfs
	systemd_dounit config/init/systemd/lxcfs.service
}

pkg_preinst() {
	# In an upgrade situation merging /var/lib/lxcfs (an empty dir)
	# fails because that is a live mountpoint when the service is
	# running.  It's unnecessary anyway so skip the action.
	[[ -d ${ROOT}/var/lib/lxcfs ]] && rm -rf ${D}/var
}
