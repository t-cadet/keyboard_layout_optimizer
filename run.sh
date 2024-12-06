#!/usr/bin/env bash


RUST_LOG=WARNING ./target/release/optimize_sa \
--do-not-remove-whitespace \
--run-forever --append-solutions-to "found_solutions.txt" \
--grouped-layout-generator \
-l config/keyboard/crkbd.yml \
-n ngrams/t-cadet/ \
--start-layouts "$(cat <<- "EOF"
😜@-o7😜]flbj😜.iea _mstrnp⇚:?;[	=dq0/6u(xg)c⌦⇚⇧⇘😜⇘⇧⇘😜⇘😜⇚😜😜😜😜😜⇧⇘⇘⇧⇚-⇩😜😜⇧😜😜⇚😜.😜
😜⌫\
⇧😜😜😜😜⇩!$⇩😜45kz⇚😜8*2,'😜}hw
{> \~ 9😜+v%1&^#y3|"<
EOF)"
