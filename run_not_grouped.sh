#!/usr/bin/env bash

# --greedy \
# --run-forever --append-solutions-to "found_solutions_not_grouped.txt" \
# 😜^vD7😜6;-=$⌦0cts X/naeo)ZRTLB😜8SAOEU_i"
# rl😜😜zV😜😜😜😜\@😜😜qmpdP⌫9'[*!4😜NFWK😜😜`😜😜%😜C(>j2H😜~#  😜😜😜?{}😜😜]gfyk😜5b,uh3JwGY↻\Q+|&<😜I.:1xM
	
RUST_LOG=INFO ./target/release/optimize_sa \
--do-not-remove-whitespace \
--grouped-layout-generator \
--run-forever \
--append-solutions-to "found_solutions_not_grouped_13_dec.txt" \
-l config/keyboard/crkbd_not_grouped.yml \
-n ngrams/t-cadet/ \
--start-layouts "$(cat <<- "EOF"
😜^vDK😜6;-=$😜0cts X/naeo)ZRTLB😜+SAOEU_i"
rl😜↻zV😜😜😜😜\@😜😜qmpdP😜9'[*!4😜NFYQ😜⌦`😜😜%😜C(>j2H😜~#	😜😜😜?{}😜😜]gfyk😜5b,uh3JwG\7😜8W|&<⌫I.:1xM
EOF
)" \
# --start-layouts "$(cat <<- "EOF"
# 😜^}$Z😜%;/01~Tst( F-naei"😜2v6[😜=,{IA!Cc)
# rl😜😜z\😜⌦😜745😜😜L.m_M😜@BG?'`😜q8😜W\😜J😜YX-PpbjDH😜😜	#😜↻😜&]39😜SgdyV😜*:uoh<⌫>Q😜K😜+N|UO😜EfwxRk
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# 😜😜}k8😜%;/05~Tst( F-naei"^2v$[😜=,{IA&Cc)
# rl😜😜z\😜😜-769😜😜L.m_M😜JDX?'!\Wq😜Z😜😜`⌫😜Y😜PpbjGH😜😜	#↻😜@*]34😜SgdyV⌦B:uoh<😜>Q😜K😜+N|UO😜EfwxR1
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# 😜😜}V7⌦%;/05~Tst( B-naei"^2v$F😜=,{IA&Cc)
# rl↻😜z\😜⌫😜😜49😜😜L.m_M😜JDX?'!😜q8😜W😜😜`😜YZ\Ppb1Gj😜😜	#😜-😜*]36😜SgdyHK[:uoh<😜>Q😜@😜+N|UO😜EfwxRk
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# ^-vDK😜|*-/😜😜0cts 	Onaeo)XRLF$😜+E<=I9_i(lr
# ⌫😜z>😜😜😜😜J\😜😜wpdyB😜6'[UH4ZVq😜😜😜7%😜@!😜A;"M28😜😜jk⌦😜~?{}😜\]gfCP😜5b,uh3QGNWY😜`x😜&#↻T.:Sm1
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# \612Z😜+S=05😜Cst( H,naeiOQ>DYB⌦;-/AEU)cf
# rl😜⌫4z😜😜😜J97😜↻L.m_P😜%MG*3!😜qW~😜😜😜\^@`😜TpvN[8😜😜	#😜-😜|]&😜😜Fgdy'😜j:uoh<😜VX😜K😜?{$}"😜IbwRkx
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# 😜↻vDK😜%>-/😜😜wcts \xnaeoE5L0FB😜$
# {=O+)i_lr(⌦😜zV😜😜😜JU😜😜\qymTP😜7G3A[8ZMNQY😜😜6😜@!-2pC4Rj😜😜	#😜😜~X<&😜😜Hdgfk😜Wb,uh*^]19😜😜`'|?}⌫:.I;S"
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# 😜😜^wv\-%>/~😜gcts YRnaeoEW]18H😜j
# ;["&:i(lr)⌦😜zV😜😜😜😜@!😜↻Dpdmk😜XB3OU`\5q6Z😜😜J😜74😜Ny0M'2😜⌫ 	#😜😜😜|=<😜😜CbfTF😜$x,uhI😜PG9K😜Q+?*{A_.LS}
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# 😜~wvK😜X-,=&😜0dtl Y;naeoEZLTF 	😜+R#/I|_i
# rsS😜😜jD⌦😜😜7😜😜😜]cpmV😜6[*O3U😜NqJ😜😜😜H↻@9😜P(25'8😜😜zk😜😜😜`><!\1gfCB😜?yu)h}⌫MGW\😜Q{%$4^A.:b"x
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# \?>;😜😜9[,}$-Tct( H
# uaeiyj"]8B😜=-<IA!Ssdnr)😜😜`q↻😜😜⌦\@😜⌫Pgm_F😜7G31'4😜0z😜W😜😜Z😜YX😜RpvMD5😜😜#	😜😜~%+&^😜Ewl.k😜/C:oh2J*6😜K😜|VQUO😜LfbNx{
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# 😜$GFZ😜|"-=&⌦Tcts XLraei)Q;v\H😜N0{IE^_
# (lnm⌫😜qV😜↻😜%!😜😜😜DpdSk😜Y'O*j5😜>z~K😜😜8😜@J😜[:hB2?😜😜W#😜😜😜}/<😜😜PgfC3😜Mb,oy19]47	😜6+😜`U\Au.xwR
# EOF
# )" \
# --start-layouts "$(cat <<- "EOF"
# 😜⌦~Tv	 😜%,=7😜wlst 50oiea_6]}83😜+
# ;/:😜)pfrnR😜😜XD😜↻😜Q9😜-😜LgdSVY4GBO[UJWz😜K⌫😜!😜😜@😜Ehkq'H😜😜NF\😜^$>`😜😜MmcCP😜2y(u.<Zj#😜\😜|&?{*AbIx"1
# EOF
# )"
