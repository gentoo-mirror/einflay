# Copyright 2020-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

KEYWORDS="~amd64 ~x86"
SLOT="0"
RESTRICT="mirror test"

inherit autotools eutils xdg-utils gnome2-utils vcs-snapshot

DESCRIPTION="Man Page Editor"
LICENSE="GPL-3"
HOMEPAGE="https://github.com/KeithDHedger/ManPageEditor"

REPO_OWNER=KeithDHedger
REPO_NAME=ManPageEditor 
EGIT_COMMIT=00d38c8973634527b59879b4fc65883ed26b493c
SRC_URI="https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/tarball/${EGIT_COMMIT} -> ${P}.tar.gz"

IUSE="spell"

RDEPEND="
	spell? ( app-text/aspell )
	x11-misc/xdg-utils
	x11-libs/gtk+:2
	x11-libs/gtksourceview:2.0"
DEPEND="${RDEPEND}"

src_prepare(){
	default
	# fdo
	sed \
		-e 's|x-maneditdoc|x-maneditdoc;|' \
		-i ManPageEditor/resources/applications/ManPageEditor.desktop
	cp "${FILESDIR}/Makefile.am" Makefile.am
	eautoreconf
}

src_configure(){
	econf $(use_enable spell aspell)
}

src_install(){
	emake DESTDIR="${D}" install
	doicon --size 256 ManPageEditor/resources/documenticons/256/maneditdoc.png
	doicon --size 128 ManPageEditor/resources/documenticons/128/maneditdoc.png
	doicon --size 48 ManPageEditor/resources/documenticons/48/maneditdoc.png
}

pkg_postinst() {
	xdg-utils_desktop_database_update
	xdg-utils_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg-utils_desktop_database_update
	xdg-utils_mime_database_update
	gnome2_icon_cache_update
}
