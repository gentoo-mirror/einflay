# Copyright 2004-2022 Sabayon Linux
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
KEYWORDS="amd64"

K_SABKERNEL_NAME="sabayon"
K_SABKERNEL_SELF_TARBALL_NAME="sabayon"
K_ONLY_SOURCES="1"
K_SABKERNEL_FORCE_SUBLEVEL="0"
K_KERNEL_NEW_VERSIONING="1"
K_SABKERNEL_PATCH_UPSTREAM_TARBALL="1"

inherit sabayon-kernel

DESCRIPTION="Official Sabayon Linux Standard kernel sources"
RESTRICT="mirror"
IUSE="sources_standalone"

DEPEND="${DEPEND}
	sources_standalone? ( !=sys-kernel/linux-sabayon-${PVR} )
	!sources_standalone? ( =sys-kernel/linux-sabayon-${PVR} )"

src_prepare() {
	default
	eapply "${FILESDIR}/MAX_ARG_STRLEN.patch"
	sabayon-kernel_src_prepare
}
