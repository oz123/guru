# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
aho-corasick-0.7.18
assert_cmd-1.0.4
bitflags-1.2.1
bstr-0.2.16
byteorder-1.4.3
cc-1.0.67
cfg-if-0.1.10
cfg-if-1.0.0
clap-2.33.3
clearscreen-1.0.4
console-0.14.1
darling-0.12.4
darling_core-0.12.4
darling_macro-0.12.4
derive_builder-0.10.2
derive_builder_core-0.10.2
derive_builder_macro-0.10.2
difference-2.0.0
dirs-2.0.2
dirs-sys-0.3.6
doc-comment-0.3.3
dtoa-0.4.8
either-1.6.1
embed-resource-1.6.2
encode_unicode-0.3.6
env_logger-0.8.3
filetime-0.2.14
fnv-1.0.7
fsevent-0.4.0
fsevent-sys-2.0.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
getrandom-0.1.16
getrandom-0.2.3
glob-0.3.0
globset-0.4.6
ident_case-1.0.1
inotify-0.7.1
inotify-sys-0.1.5
insta-1.7.1
iovec-0.1.4
itoa-0.4.7
kernel32-sys-0.2.2
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.94
linked-hash-map-0.5.4
log-0.4.14
memchr-2.4.0
mio-0.6.23
mio-extras-2.0.6
miow-0.2.2
net2-0.2.37
nix-0.20.0
nom-5.1.2
notify-4.0.17
phf-0.8.0
phf_codegen-0.8.0
phf_generator-0.8.0
phf_shared-0.8.0
ppv-lite86-0.2.10
predicates-1.0.8
predicates-core-1.0.2
predicates-tree-1.0.2
proc-macro2-1.0.27
quote-1.0.9
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
rand_pcg-0.2.1
redox_syscall-0.2.8
redox_users-0.4.0
regex-1.5.4
regex-automata-0.1.9
regex-syntax-0.6.25
ryu-1.0.5
same-file-1.0.6
serde-1.0.126
serde_derive-1.0.126
serde_json-1.0.64
serde_yaml-0.8.17
similar-1.3.0
siphasher-0.3.5
slab-0.4.3
strsim-0.10.0
syn-1.0.72
term_size-0.3.2
terminal_size-0.1.17
terminfo-0.7.3
textwrap-0.11.0
thiserror-1.0.24
thiserror-impl-1.0.24
treeline-0.1.0
unicode-width-0.1.8
unicode-xid-0.2.2
uuid-0.8.2
version_check-0.9.3
vswhom-0.1.0
vswhom-sys-0.1.0
wait-timeout-0.2.0
walkdir-2.3.2
wasi-0.10.2+wasi-snapshot-preview1
wasi-0.9.0+wasi-snapshot-preview1
which-4.1.0
winapi-0.2.8
winapi-0.3.9
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.8.0
ws2_32-sys-0.2.1
yaml-rust-0.4.5
"

inherit cargo

DESCRIPTION="Executes commands in response to file modifications"
HOMEPAGE="https://github.com/watchexec/watchexec"
SRC_URI="https://github.com/watchexec/${PN}/archive/refs/tags/cli-v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" $(cargo_crate_uris ${CRATES})"
# Prevent portage from trying to fetch bunch of *.crate from mirror despite they are not mirrored.
RESTRICT="mirror"
LICENSE="Apache-2.0 BSD CC0-1.0 ISC MIT WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}-cli-v${PV}"
DOCS=( README.md )
HTML_DOCS=( doc/watchexec.1.html )

DEPEND=""
RDEPEND=""

QA_FLAGS_IGNORED="usr/bin/watchexec"

src_compile() {
	cargo_src_compile --manifest-path=cli/Cargo.toml
}

src_install() {
	cargo_src_install --path cli

	einstalldocs
	doman doc/watchexec.1

	insinto /usr/share/zsh/site-functions
	newins completions/zsh _watchexec
}
