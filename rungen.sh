#!/usr/bin/env bash

# --run-forever --append-solutions-to "found_solutions.txt" \

RUST_LOG=DEBUG ./target/release/optimize_genetic \
--do-not-remove-whitespace \
--grouped-layout-generator \
-l config/keyboard/crkbd.yml \
-n ngrams/t-cadet/ \
--start-layout "$(cat <<- "EOF"
.⇚*
{2\5dw~😜0oein)_ strx!"+=l-	[;1'6,p:/f}⇚⇩	⇧⇧😜😜😜⌦😜😜 😜⇘😜😜⇘😜😜😜⌫😜⇩
😜
⇧-😜😜😜⇚😜⇘😜😜⇧⇘😜⇚⇚⇚😜⇘&3^7⇘⇩vz😜⇧4huam]😜kcgb>⇧<|@yj😜\89$😜q.#%(?
EOF)"
