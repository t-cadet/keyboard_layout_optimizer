#!/usr/bin/env bash

# --greedy \

RUST_LOG=WARNING ./target/release/optimize_sa \
--do-not-remove-whitespace \
--run-forever --append-solutions-to "found_solutions_grouped.txt" \
--grouped-layout-generator \
-l config/keyboard/crkbd.yml \
-n ngrams/t-cadet/ \
--start-layouts "$(cat <<- "EOF"
~qbf$\#-i=&@wdst 	:uaeo_6"0]8-{,;/)}[lhnr
😜😜vg⌦😜😜^|%😜😜kmcpj😜7'2y<!9+5z😜😜😜?\34⌫*(.>x1
EOF
)"
# 	
# ^6{dw1↻~
# "@⌫hrnstf[ aeiy8]x+m}😜_320😜-)/;p,😜😜😜😜😜😜😜😜😜😜😜😜😜😜😜😜😜😜\😜😜😜😜😜😜😜😜😜😜😜😜😜😜⌦😜😜😜😜😜😜😜😜😜$#*!%😜-	?😜😜>blcgk😜.uo'|😜q&zvj😜😜974😜=(<\:5
