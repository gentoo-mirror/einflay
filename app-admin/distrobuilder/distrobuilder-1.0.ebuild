# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="System container image builder for LXC and LXD"
HOMEPAGE="https://linuxcontainers.org/distrobuilder/introduction/"
LICENSE="Apache-2.0"
SLOT="0"

EGO_PN="github.com/lxc/distrobuilder"

EGO_VENDOR=(
	"github.com/antchfx/xpath 496661144dd35339be6985b945ae86a1b17d7064"
	"github.com/davecgh/go-spew d8f796af33cc11cb798c1aaeb27a4ebc5099927d"
	"github.com/flosch/pongo2 bbf5a6c351f4d4e883daa40046a404d7553e0a00"
	"github.com/gobuffalo/logger fe10b71a76d5acb502f99cd88d1fd28062906dac"
	"github.com/gobuffalo/packd 128b5da43f114d0f9af8b4bba549b02e3496dfa8"
	"github.com/gobuffalo/packr c6a5045204dacffbe11d9f6c68485ae7e7fe3d19"
	"github.com/golang/groupcache 8c9f03a8e57eb486e42badaed3fb287da51807ba"
	"github.com/gorilla/websocket b65e62901fc1c0d968042419e74789f6af455eb9"
	"github.com/juju/errors 3fe23663418fc1d724868c84f21b7519bbac7441"
	"github.com/karrick/godirwalk 28c3d9464220f734271ebb33c7da824390ba03c5"
	"github.com/lxc/lxd fcbba262a7b70cb00afdc40e189e6a008f44b2ee"
	"github.com/markbates/errx 9ba0abfab1fb7dae1b752c31e1731b4c179e7ca0"
	"github.com/markbates/oncer 74cf68f7e72ed26f7a701d975dbcee92cd324cbb"
	"github.com/markbates/safe 6fea05a5732486546a4836b7a1d596c5ec687b98"
	"github.com/mudler/docker-companion b8b364100616cf6e9c40f8944b418dc1ce2e137e"
	"github.com/pkg/errors 614d223910a179a466c1767a985424175c39b465"
	"github.com/pmezard/go-difflib 5d4384ee4fb2527b0a1256a821ebfc92f91efefc"
	"github.com/sirupsen/logrus d417be0fe654de640a82370515129985b407c7e3"
	"github.com/spf13/cobra b80aeb17fc46362ff9cea51437a719322f8965ac"
	"github.com/spf13/pflag 2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
	"github.com/stretchr/testify bb468cc94d35e4c2a709db0e0f5bc54887248c0e"
	"golang.org/x/crypto baeed622b8d86045ff442b324772b0ad306a2b3f github.com/golang/crypto"
	"golang.org/x/net d3edc9973b7eb1fb302b0ff2c62357091cea9a30 github.com/golang/net"
	"golang.org/x/sys c3d80250170dec19bf61949c81233cede5ddaf61 github.com/golang/sys"
	"golang.org/x/text 06d492aade888ab8698aad35476286b7b555c961 github.com/golang/text"
	"gopkg.in/antchfx/htmlquery.v1 b3aab73e1fab21eda5df53a9fbf67fc053561222 github.com/antchfx/htmlquery"
	"gopkg.in/flosch/pongo2.v3 5e81b817a0c48c1c57cdf1a9056cf76bdee02ca9 github.com/flosch/pongo2"
	"gopkg.in/robfig/cron.v2 be2e0b0deed5a68ffee390b4583a13aff8321535 github.com/robfig/cron"
	"gopkg.in/yaml.v2 53403b58ad1b561927d19068c655246f2db79d48 github.com/go-yaml/yaml"
)

inherit golang-vcs-snapshot

RESTRICT="mirror"
EGIT_COMMIT="f6b2a160a7e3e5e9d3c5767cf07c8cd03a3eca1d"
SRC_URI="https://github.com/lxc/distrobuilder/archive/${EGIT_COMMIT}.tar.gz -> ${CATEGORY}-${PN}-${PV}.tar.gz
	${EGO_VENDOR_URI}"
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

inherit golang-build

src_compile()
{
	cd "${WORKDIR}/${P}/src/${EGO_PN}" || die "cd failed"
	GOPATH="${WORKDIR}/${P}" make || die "make failed"
}

src_install() {
	local TARGET_DIR=$(dirname "$(get_golibdir)/pkg/$(go env GOOS)_$(go env GOARCH)/${EGO_PN%/*}")
	exeinto "${TARGET_DIR}"
	doexe "${WORKDIR}/${P}/bin/distrobuilder"
	dosym "${TARGET_DIR}/distrobuilder"  "${EPREFIX}/usr/bin/distrobuilder"
}
