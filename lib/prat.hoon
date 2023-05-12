/-  prat
/+  diff
|%
++  par-diff  ;~(plug (jest 'diff') ace stap ace dem:ag ace dem:ag)
++  par-draw  ;~(plug (jest 'draw') ace stap)
++  par-span  ;~(plug (jest 'span') ace stap ace sym:so ace sym:so ace sym:so)
++  par-name  ;~(plug (jest 'name') ace sym:so ace sym:so)
++  par-name-rev  ;~(plug (jest 'name') ace sym:so ace sym:so ace dem:ag)
++  par       ;~(pose par-diff par-draw par-span par-name-rev par-name)
++  cmd-diff
  %+  cook
  ::     diff          /pax          1            2
  |=  [p=cord q=cord r=path s=cord t=@ud u=cord v=@ud]
  ^-  action:prat
  diff+[r t v]
  par-diff
++  cmd-draw
  %+  cook
  ::     draw          /pax
  |=  [p=cord q=cord r=path]
  ^-  action:prat
  draw+r
  par-draw
++  cmd-span
  %+  cook
  ::     span          /pax          from-mold          to-mark      to-mold
  |=  [p=cord q=cord r=path s=cord t=term u=cord v=term w=cord x=term]
  ^-  action:prat
  span+[r t v x]
  par-span
++  cmd-name
  %+  cook
  ::     name          desk          label
  |=  [p=cord q=cord r=term s=cord t=term]
  ^-  action:prat
  name+[r t]
  par-name
++  cmd-name-rev
  %+  cook
  ::     name          desk          label         aeon
  |=  [p=cord q=cord r=term s=cord t=term u=cord v=aeon:clay]
  ^-  action:prat
  name-rev+[r t v]
  par-name-rev
++  parser  ;~(pose cmd-diff cmd-draw cmd-span cmd-name-rev cmd-name)
::
++  draw-file
  |=  =path
  ^-  wain   :: (list cord)
  %-  to-wain:format
  .^(@t %cx path)
::
++  wall-to-wain
  |=  =wall
  ^-  wain
  =|  =wain
  |-
  ?~  wall  wain
  $(wall t.wall, wain (snoc wain (crip i.wall)))
++  wain-to-wall
  |=  =wain
  ^-  wall
  =|  =wall
  |-
  ?~  wain  wall
  $(wain t.wain, wall (snoc wall (trip i.wain)))
++  diff-files
  |=  [=path v1=@ud v2=@ud]
  ^-  wain
  %-  wall-to-wain
  =/  pal  `^path`:(weld (scag 2 `^path`path) `^path`~[(scot %ud v1)] (slag 3 path))
  =/  par  `^path`:(weld (scag 2 `^path`path) `^path`~[(scot %ud v2)] (slag 3 path))
  =/  lhs  ?.  .^(? %cu pal)  *(list tape)  (turn (to-wain:format .^(cord %cx pal)) trip)
  =/  rhs  ?.  .^(? %cu par)  *(list tape)  (turn (to-wain:format .^(cord %cx par)) trip)
  ~&  >  lhs
  ~&  >>  rhs
  ~&  >>>  (lcs:diff lhs rhs)
  (lcs:diff lhs rhs)
::
++  span-marks
  |=  $:  =path
          from-mold=term
          to-mark=term
          to-mold=term
      ==
  =/  from-mark  (rear path)
  !:
  =/  converter  .^($-((span-operate from-mold) (span-operate to-mold)) %cf /===/from-mark/to-mark)
  (converter path)
::
++  span-operate
  |=  =term
  ~|  "{<term>} not found as candidate mold."
  ?+    term  !!
      %html         html
      %hymn         html
      %json         json
      %mime         mime
      %noun         noun
      %wain         wain
      %wall         wall
  ==
::
--
