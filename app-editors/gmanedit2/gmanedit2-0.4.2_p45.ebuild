# Copyright 2020-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

DESCRIPTION="An editor for man pages that runs on X using the GTK+ libraries."
LICENSE="GPL-2"
HOMEPAGE="https://github.com/Distrotech/gmanedit2"

# app-editors/gmanedit2
# gmanedit2-0.4.2_p45.ebuild

IUSE=""

DEPEND="x11-libs/gtksourceview:2.0
	>=x11-libs/gtk+-2.24.12"
RDEPEND="${DEPEND}
	"

inherit vcs-snapshot

REPO_OWNER=Distrotech
REPO_NAME=gmanedit2
EGIT_COMMIT=2c0b06288b56d2384efd7fd80f26546de244f52c

SRC_URI="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/tarball/${EGIT_COMMIT} -> ${P}.tar.gz"
