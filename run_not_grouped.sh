#!/usr/bin/env bash

# --greedy \

RUST_LOG=INFO ./target/release/optimize_sa \
--do-not-remove-whitespace \
--grouped-layout-generator \
--run-forever --append-solutions-to "found_solutions_not_grouped.txt" \
-l config/keyboard/crkbd_not_grouped.yml \
-n ngrams/t-cadet/ \
--start-layouts "$(cat <<- "EOF"
😜612Z😜+S=05⌫Cst( H,naeiOQ>DYB😜;-/AEU)cf
rl😜😜4z😜😜😜J97\😜L.m_P😜%MG*3!😜qW~😜😜😜\^@`😜TpvN[8⌦😜	#😜😜😜|]&😜😜Fgdy'😜j:uoh<😜VX😜K-?{$}"↻IbwRkx
EOF
)"
# 	
# ^6{dw1↻~
# "@⌫hrnstf[ aeiy8]x+m}😜_320😜-)/;p,😜😜😜😜😜😜😜😜😜😜😜😜😜😜😜😜😜😜\😜😜😜😜😜😜😜😜😜😜😜😜😜😜⌦😜😜😜😜😜😜😜😜😜$#*!%😜-	?😜😜>blcgk😜.uo'|😜q&zvj😜😜974😜=(<\:5
