# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
SLOT="0"
KEYWORDS="amd64"

PYTHON_COMPAT=( python3_7 )

inherit font python-any-r1

DESCRIPTION="Free version of Russian standard (GOST) Type1 fonts"
HOMEPAGE="https://bitbucket.org/fat_angel/opengostfont"
SRC_URI="https://bitbucket.org/fat_angel/${PN}/downloads/${PN}-src-${PV}.tar.xz"

LICENSE="OFL-1.1"

FONT_SUFFIX="ttf"

DEPEND="app-arch/xz-utils
	${PYTHON_DEPS}
	media-gfx/fontforge
	dev-python/fonttools"

DOCS="LICENSE"

S="${WORKDIR}/${PN}-src-${PV}"

src_prepare()
{
	eapply "${FILESDIR}/exception.patch"
	eapply_user
}

pkg_setup() {
	FONT_S="${S}/${PN}-ttf-${PV}"
	python-any-r1_pkg_setup
	font_pkg_setup
}
