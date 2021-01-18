# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )

inherit desktop distutils-r1 xdg-utils git-r3

DESCRIPTION="A cross platform front-end GUI of the popular youtube-dl"
HOMEPAGE="https://mrs0m30n3.github.io/youtube-dl-gui/"
LICENSE="Unlicense"
EGIT_REPO_URI="https://github.com/MrS0m30n3/youtube-dl-gui"

KEYWORDS="~amd64 ~x86"
IUSE="+ffmpeg"
SLOT="0"

BDEPEND="sys-devel/gettext"
DEPEND="${PYTHON_DEPS}"
RDEPEND="
	${DEPEND}
	dev-python/wxpython:3.0[${PYTHON_USEDEP}]
	dev-python/twodict[${PYTHON_USEDEP}]
	net-misc/youtube-dl
	ffmpeg? ( media-video/ffmpeg )"

python_install_all() {
	
	distutils-r1_python_install_all

	make_desktop_entry $PN \
		"Youtube-DLG" \
		"youtube-dl-gui" \
		"Network;GTK;"

}

pkg_postinst() {

	xdg_icon_cache_update
	xdg_desktop_database_update

}

pkg_postrm() {

	xdg_icon_cache_update
	xdg_desktop_database_update

}
