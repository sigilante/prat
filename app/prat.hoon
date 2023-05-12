/-  prat
/+  default-agent, dbug, pratlib=prat, shoe, sole
|%
+$  versioned-state
  $%  state-0
  ==
+$  state-0  %0
+$  card  card:agent:shoe
--
%-  agent:dbug
=|  state-0
=*  state  -
^-  agent:gall
%-  (agent:shoe action:prat)
^-  (shoe:shoe action:prat)
|_  =bowl:gall
+*  this     .
    default  ~(. (default-agent this %|) bowl)
    leather  ~(. (default:shoe this action:prat) bowl)
++  on-init   on-init:default
++  on-save   !>(state)
++  on-load
  |=  old=vase
  ^-  (quip card _this)
  `this(state !<(state-0 old))
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
  ?>  =(our src):bowl
  ?+    mark  (on-poke:default [mark vase])
  ::
      %prat-action    
    =+  !<(=action:prat vase)
    ?-    -.action
        %draw
      =/  =tape  (draw-file:pratlib path:action)
      :_  this
      :~  [%shoe ~ sole+klr+~[(crip ~(ram re leaf+tape))]]
      ==
      ::
        %diff
      =/  =tape  (diff-files:pratlib path:action v1:action v2:action)
      :_  this
      :~  [%shoe ~ sole+klr+~[(crip ~(ram re leaf+tape))]]
      ==
      ::
        %span
      =/  =tape  (span-marks:pratlib path:action from-mark:action to-mold:action to-mark:action)
      :_  this
      :~  [%shoe ~ sole+klr+~[(crip ~(ram re leaf+tape))]]
      ==
      ::
        %name
      ::  name desk label
      =/  path  /(scot %p our:bowl)/[desk:action]/(scot %da now:bowl)
      =/  aeon  ud:.^(cass:clay %cw path)
      :_  this
      :~  [%pass /prat %arvo %c %info desk:action %| label:action `aeon]
      ==
      ::
        %name-rev
      ::  name desk label aeon
      =/  path  /(scot %p our:bowl)/[desk:action]/(scot %ud aeon:action)
      =/  aeon  ud:.^(cass:clay %cw path)
      :_  this
      :~  [%pass /prat %arvo %c %info desk:action %| label:action `aeon]
      ==
    ==
  ==
++  on-peek   on-peek:default
++  on-arvo   on-arvo:default
++  on-watch  on-watch:default
++  on-leave  on-leave:default
++  on-agent  on-agent:default
++  on-fail   on-fail:default
++  command-parser
  |=  =sole-id:shoe
  ^+  |~(nail *(like [? action:prat]))
  %+  stag  |
  parser:pratlib
++  on-command
  |=  [=sole-id:shoe =action:prat]
  ^-  (quip card _this)
  (on-poke %prat-action !>(action))
++  can-connect
  |=  =sole-id:shoe
  ^-  ?
  ?|  =(~zod src.bowl)
      (team:title [our src]:bowl)
  ==
++  on-connect     on-connect:leather
++  on-disconnect  on-disconnect:leather
++  tab-list       tab-list:leather
--
