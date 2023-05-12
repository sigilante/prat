|%
++  linebreak
  |=  =tape
  ^-  wall
  =/  lines  *wall
  |-  ^-  wall
  =/  idx  (find "\0a" tape)
  ?~  idx  (snoc lines tape)
  $(lines (snoc lines (scag (need idx) tape)), tape (slag +((need idx)) tape))
++  lcs
  ::  bit of a joke:  X-tudo is a cheeseburger w/ everything in Brazil
  |=  [xtudo=wall ytudo=wall]
  ^-  wall
  ::  if no lines left, return
  ?~  xtudo   *wall
  ?~  ytudo   *wall
  ::  final result
  =/  lcs  *wall
  ::|-  ^-  wall
  =/  xhead=tape   -:(scag 1 `wall`xtudo)
  =/  yhead=tape   -:(scag 1 `wall`ytudo)
  =/  xtail=wall   (slag 1 `wall`xtudo)
  =/  ytail=wall   (slag 1 `wall`ytudo)
  ?:  =(xhead yhead)
    (weld ~[xhead] $(xtudo xtail, ytudo ytail))
  =/  xhead-ytail  $(ytudo ytail)
  =/  yhead-xtail  $(xtudo xtail)
  ?:  (gth (lent xhead-ytail) (lent yhead-xtail))
    xhead-ytail
  yhead-xtail
+$  op  ?(%d %a %$)
++  left-hand   :: deletions
  |=  [x=wall lcs=wall]
  =|  lines=((mop @ud op) gth)
  =/  on  ((on @ud op) gth)
  =/  idx  0
  =/  ids  0
  |-  ^+  lines
  ?:  =((lent x) idx)  lines
  ?:  =((snag idx x) (snag ids lcs))
    :: same in both
    $(idx +(idx), ids +(ids), lines (put:on lines idx %$))
  :: not found in lcs
  $(idx +(idx), lines (put:on lines idx %d))
++  right-hand  ::  additions
  |=  [lcs=wall y=wall]
  =|  lines=((mop @ud op) gth)
  =/  on  ((on @ud op) gth)
  =/  idy  0
  =/  ids  0
  |-  ^+  lines
  ?:  =((lent y) idy)  lines
  ?:  =((snag idy y) (snag ids lcs))
    :: same in both
    $(idy +(idy), ids +(ids), lines (put:on lines idy %$))
  :: not found in lcs
  $(idy +(idy), lines (put:on lines idy %a))
--
