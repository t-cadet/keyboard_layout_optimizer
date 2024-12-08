#!/usr/bin/env bash

# RUST_LOG=INFO ./target/release/plot \
# --do-not-remove-whitespace \
# --grouped-layout-generator \
# -l config/keyboard/crkbd.yml \
# "$(cat <<- "EOF"
# ⇚qv-P8>E/=#.Cpnt .hreocgJ*bz(_;l})y3msdiau😜⇘⇘⇩⇧
# ⇩😜
# ⇧⇧😜😜- ^W😜😜=⇩⇘😜⇩😜⇚⇚😜😜😜
# 😜😜😜😜⇘😜⇧⇚⇘😜😜⇧😜$2@↻5OFG😜\V,:
# 69{xfSwD⇧j	 \😜+'4]17X"!L0B⇚😜😜 ⇧⇘⇚U|&⌦⇚😜⇧Tk⇘😜`[AIMW⇚😜😜😜⌫⇘~?😜%Y😜KRZHN<
# EOF
# )"
	
RUST_LOG=INFO ./target/release/plot \
--do-not-remove-whitespace \
--grouped-layout-generator \
-l config/keyboard/crkbd.yml \
"$(cat <<- "EOF"
~qbf$\#-i=&@wdst 	:uaeo_6"0]8-{,;/)}[lhnr
😜😜vg⌦😜😜^|%😜😜kmcpj😜7'2y<!9+5z😜😜😜?\34⌫*(.>x1
EOF
)"
