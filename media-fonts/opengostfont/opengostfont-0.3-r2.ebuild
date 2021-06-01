# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Ebuild request bug:
# https://bugs.gentoo.org/433786

SLOT="0"
KEYWORDS="amd64 arm64"

PYTHON_COMPAT=( python3_9 )

inherit font python-any-r1

DESCRIPTION="Free version of Russian standard (GOST) Type1 fonts"
HOMEPAGE="https://bitbucket.org/fat_angel/opengostfont"

# SRC_URI="https://bitbucket.org/fat_angel/${PN}/downloads/${PN}-src-${PV}.tar.xz"
# SRC_URI="https://webfonts.ru/original/opengosta/opengosta.zip"
SRC_URI="https://bitbucket-archive.softwareheritage.org/new-static/f6/f638fddd-3d47-4470-98f8-851196b76418/attachments/opengostfont-src-0.3.tar.xz -> ${PN}-src-${PV}.tar.xz"
S="${WORKDIR}/opengostfont-src-0.3"

LICENSE="OFL-1.1"

FONT_SUFFIX="ttf"

DEPEND="app-arch/xz-utils
	${PYTHON_DEPS}
	media-gfx/fontforge[python]
	dev-python/fonttools"

DOCS="LICENSE"

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
