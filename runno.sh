#!/usr/bin/env bash

# --greedy \
# --run-forever --append-solutions-to "found_solutions_not_grouped.txt" \

RUST_LOG=INFO ./target/release/optimize_sa \
--do-not-remove-whitespace \
--grouped-layout-generator \
-l config/keyboard/crkbd_not_grouped.yml \
-n ngrams/t-cadet/ \
--start-layouts "$(cat <<- "EOF"
😜~wvK😜4#/*😜😜bdtl 5=iaeo.QTLFB😜&:+OI!2s(rnR😜😜jk😜😜-^%😜😜😜qcpCP😜8VSE>`JDNY😜😜😜\😜@U\AhyH1$😜↻zW😜⌦9Z?6😜⌫0gf-'😜3),u;[😜GMX	😜7}|<{😜]_"m
x
EOF
)"
