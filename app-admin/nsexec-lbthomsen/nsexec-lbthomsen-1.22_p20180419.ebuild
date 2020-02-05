# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

RESTRICT="mirror"
KEYWORDS="~amd64"

SLOT="0"

DESCRIPTION="Utilities for non-root LXC containers"
HOMEPAGE="https://github.com/lbthomsen/nsexec"
EGIT_COMMIT="13376b1335d3c7bb79e62bd355b558f03a60ed43"
SRC_URI="https://github.com/lbthomsen/nsexec/archive/${EGIT_COMMIT}.tar.gz"
S="${WORKDIR}/nsexec-${EGIT_COMMIT}"

src_install()
{
	mkdir -p "${D}/usr/bin" || die
	default
}