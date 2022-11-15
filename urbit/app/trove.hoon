::
/-  *trove, m=membership, s=spaces-store, v=visas
/+   dbug, default-agent, verb
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0
  $:  %0
      troves=(map spat [=team =regs =trove])
      ipfs=[node=@t code=@t]
  ==
::
::
::  boilerplate
::
+$  card  card:agent:gall
--
::
%+  verb  &
%-  agent:dbug
=|  state-0
=*  state  -
::
^-  agent:gall
::
=<
  |_  =bowl:gall
  +*  this  .
      def  ~(. (default-agent this %|) bowl)
      eng   ~(. +> [bowl ~])
  ++  on-init
    ^-  (quip card _this)
    ~>  %bout.[0 '%trove +on-init']
    =^  cards  state
      abet:init:eng
    [cards this]
  ::
  ++  on-save
    ^-  vase
    ~>  %bout.[0 '%trove +on-save']
    !>(state)
  ::
  ++  on-load
    |=  ole=vase
    ~>  %bout.[0 '%trove +on-load']
    ^-  (quip card _this)
    =^  cards  state
      abet:(load:eng ole)
    [cards this]
  ::
  ++  on-poke
    |=  [mar=mark vaz=vase]
    ~>  %bout.[0 '%trove +on-poke']
    ^-  (quip card _this)
    `this
  ::
  ++  on-peek
    |=  =path
    ~>  %bout.[0 '%trove +on-peek']
    ^-  (unit (unit cage))
    (peek:eng path)
  ::
  ++  on-agent
    |=  [wir=wire sig=sign:agent:gall]
    ~>  %bout.[0 '%trove +on-agent']
    ^-  (quip card _this)
    =^  cards  state
      abet:(dude:eng wir sig)
    [cards this]
  ::
  ++  on-arvo
    |=  [wir=wire sig=sign-arvo]
    ~>  %bout.[0 '%trove +on-arvo']
    ^-  (quip card _this)
    `this
  ::
  ++  on-watch
  |=  =path
  ~>  %bout.[0 '%trove +on-watch']
  ^-  (quip card _this)
  =^  cards  state
    abet:(peer:eng path)
  [cards this]
  ::
  ++  on-fail
    ~>  %bout.[0 '%trove +on-fail']
    on-fail:def
  ::
  ++  on-leave
    ~>  %bout.[0 '%trove +on-init']
    on-leave:def
  --
|_  [bol=bowl:gall dek=(list card)]
+*  dat  .
    our  (scot %p our.bol)
    now  (scot %da now.bol)
++  emit  |=(=card dat(dek [card dek]))
++  emil  |=(lac=(list card) dat(dek (welp lac dek)))
++  abet
  ^-  (quip card _state)
  [(flop dek) state]
::  +show: send web-ui fact
::
++  show  |=(cag=cage (emit %give %fact [/web-ui]~ cag))
::  +init: handle on-init
::
++  init
  ^+  dat
  =^  cards  state
    sa-abet:sa-view:sa
  (emil cards)
::  +load: handle on-load
::
++  load
  |=  vaz=vase
  ^+  dat
  ?>  ?=([%0 *] q.vaz)
  =.  state  !<(state-0 vaz)
  dat
::  +peek: handle on-peek (unit (unit cage))
::
++  peek
  |=  pol=(pole knot)
  ^-  (unit (unit cage))
  ?+    pol  !!
      [%x %state ~]
    ``trove-state-0+!>(state)
  ==
::  +peer: handle on-watch
::
++  peer
  |=  pol=(pole knot)
  ^+  dat
  ?+    pol  ~|(bad-watch-path/pol !!)
      [%web-ui ~]
    (show trove-state-0+!>(state))
  ::
      [%trove host=@ name=@ rest=*]
    =+  sap=[(slav %p host.pol) (slav %t name.pol)]
    =^  cards  state
      to-abet:(to-peer:to-your:(to-abed:to sap) rest.pol)
    (emil cards)
  ==
::  +dude: handle on-agent
::
++  dude
  |=  [pol=(pole knot) sig=sign:agent:gall]
  ^+  dat
  =^  cards  state
    ?+    pol  ~|(bad-dude-wire/pol !!)
        [%spaces %updates ~]
      ?+    -.sig  `state
        %kick  sa-abet:sa-view:sa
        %fact  sa-abet:(sa-dude:sa cage.sig)
      ::
          %watch-ack
        %.  `state
        ?~(p.sig same (slog leaf/"%spaces nack" ~))
      ==
    ::
        [%from host=@ name=@ rest=*]
      =+  sap=[(slav %p host.pol) name.pol]
      ?+    -.sig  `state
        %kick  to-abet:to-view:to-your:(to-abed:to sap)
      ::
          %watch-ack
        ?~  p.sig  `state
        `state(troves (~(del by troves) sap))
      ::
          %fact
        ?>  ?=(%trove-fact p.cage.sig)
        =/  act=fact  !<(fact q.cage.sig)
        to-abet:(to-poke:(to-abed:to p.act) act)
      ==
    ==
  (emil cards)
::  +poke: handle on-poke
::
++  poke
  |=  [mar=mark vaz=vase]
  =^  cards  state
    ?+    mar  ~|(bad-trove-mark/mar !!)
        %trove-action
      =/  act=action:^poke  !<(action:^poke vaz)
      to-abet:(to-poke:to-your:(to-abed:to p.act) act)
    ==
  (emil cards)
::  +to: trove engine
::
++  to
  |_  $:  sup=(unit spat)
          tam=team
          rag=regs
          tov=trove
          caz=(list card)
          ewe=(set role)
      ==
  ++  to  .
  ++  to-emit  |=(c=card to(caz [c caz]))
  ++  to-emil  |=(lc=(list card) to(caz (welp lc caz)))
  ++  to-abet  ^-((quip card _state) [(flop caz) state])
  ++  to-show  |=(cag=cage (to-emit %give %fact [/web-ui]~ cag))
  ::
  ++  to-abed
    |=  sap=spat
    =+  have=(~(got by troves) sap)
    %=  to
      sup  `sap
      tam  team.have
      rag  regs.have
      tov  trove.have
    ==
  ::
  ++  to-view
    ^+  to
    =+  sap=(need sup)
    =+  dok=[p.sap %trove]
    =+  wir=`path`/(scot %p p.sap)/[q.sap]
    =/  mem=(list card)
      [%pass from+wir %agent dok %watch trove+wir]~
    =?    mem
        (~(has in ewe) %admin)
      ^-  (list card)
      :_  mem
      :+  %pass  from+(snoc wir %admin)
      [%agent dok %watch trove+(snoc wir %admin)]
    =?    mem
        (~(has in ewe) %moderator)
      ^-  (list card)
      :_  mem
      :+  %pass  from+(snoc wir %moderator)
      [%agent dok %watch trove+(snoc wir %moderator)]
    (to-emil mem)
  ::  +to-perm: give trail, get last relevant permission
  ::
  ++  to-perm
    |=  t=trail
    ^-  perm
    |-  ?~  t  (~(got by rag) t)
    ?^(hav=(~(get by rag) t) u.hav $(t (snip `trail`t)))
  ::  +compare: give containing perms & sub-perms, nest?
  ::
  ++  compare
    |=  [p=perm q=perm]
    ?&  =(~ (~(dif in add.files.q) add.files.p))
        =(~ (~(dif in edit.files.q) edit.files.p))
        =(~ (~(dif in move.files.q) move.files.p))
        =(~ (~(dif in delete.files.q) delete.files.p))
      ::
        =(~ (~(dif in read.folder.q) read.folder.p))
        =(~ (~(dif in add.folder.q) add.folder.p))
        =(~ (~(dif in edit.folder.q) edit.folder.p))
        =(~ (~(dif in move.folder.q) move.folder.p))
        =(~ (~(dif in delete.folder.q) delete.folder.p))
        =(~ (~(dif in ch-mod.folder.q) ch-mod.folder.p))
    ==
      ::
  ::  +to-cher: share with your subscribers
  ::
  ++  to-cher
    |=  [how=(unit path) cag=cage]
    ^+  to
    ?~  how  (to-emit %give %fact ~ cag)
    =+  sap=(need sup)
    =+  sal=/(scot %p p.sap)/[q.sap]
    =+  wir=:(welp /trove sal (need how))
    (to-emit %give %fact [wir]~ cag)
  ::  +to-send: send instructions to the host
  ::
  ++  to-send
    |=  [p=spat q=poke:^poke]
    ^+  to
    =+  dok=[p.p %trove]
    =+  wir=/action/(scot %p p.p)/[q.p]/(scot %da now.bol)
    %-  to-emit
    :^  %pass  wir  %agent
    [dok %poke %trove-action !>(`action:^poke`[p q])]
  ::  +to-your: get src.bol's permissions in a trove
  ::
  ++  to-your
    =+  sap=(need sup)
    %=  to
        ewe
      =?    ewe
          (~(has in admins.tam) src.bol)
        (~(put in ewe) %admin)
      =?    ewe
          (~(has in members.tam) src.bol)
        (~(put in ewe) %member)
      ?.  (~(has in moderators.tam) src.bol)  ewe
      (~(put in ewe) %moderator)
    ==
  ::  +to-poke: handle pokes and facts, indiscriminately
  ::
  ++  to-poke
    |=  f=fact
    ^+  to
    =+  sap=(need sup)
    ?>  =(p.f p.sap)
    ?-    -.q.f
        %new
      ?>  =(p.p.f src.bol)
      =/  ole=tract
        ?~(g=(~(get of `trove`tov) trail.q.f) *tract u.g)
      =.  tov
        %-  ~(put of `trove`tov)
        [trail.q.f (~(put by ole) id.q.f node.q.f)]
      =.  troves  (~(put by troves) p.f [tam rag tov])
      (to-show trove-fact+!>(f))
    ::
        %start
      ?>  =(p.p.f src.bol)
      %.  trove-fact+!>(f)
      %=    to-show
          troves
        %+  ~(put by troves)  p.f
        :+  tam
          (~(uni by rag) p.q.f)
        =/  neu=(list [p=path t=tract])
          ~(tap of `trove`q.q.f)
        =|  tew=_tov
        |-  ?~  neu  tew
        %=    $
          neu  t.neu
        ::
            tew
          ?~  got=(~(get of `trove`tew) p.i.neu)
            (~(put of `trove`tew) p.i.neu t.i.neu)
          %+  ~(put of `trove`tew)  p.i.neu
          (~(uni by u.got) t.i.neu)
        ==
      ==
    ::
        %add-moderators
      ?>  =(p.sap src.bol)
      =.  moderators.tam
        (~(uni in moderators.tam) +.q.f)
      =.  troves  (~(put by troves) sap [tam rag tov])
      %.  trove-fact+!>(f)
      ?.(=(our.bol p.sap) to-show (cury to-cher `*path))
    ::
        %rem-moderators
      ?>  =(p.sap src.bol)
      =.  moderators.tam
        %-  ~(rep in +.q.f)
        |=([p=ship m=_moderators.tam] (~(del in m) p))
      =.  troves  (~(put by troves) sap [tam rag tov])
      %.  trove-fact+!>(f)
      ?.(=(our.bol p.sap) to-show (cury to-cher `*path))
    ::
      %rehome  to
      %repeat  to
    ::
        %add-node
      =+  hav=(~(get of `trove`tov) trail.q.f)
      =+  perms=(to-perm trail.q.f)
      ?>  ?|  =(our.bol src.bol)
              =(p.sap src.bol)
          ::
            %-  ~(rep in ewe)
            |=  [r=role o=_|]
            ?^  hav  ?:((~(has in add.files.perms) r) & o)
            ?:  ?&  (~(has in add.files.perms) r)
                    (~(has in add.folder.perms) r)
                ==
            &  o
          ==
      ?.  =(our.bol p.sap)
        ?.  =(our.bol src.bol)  !!  :: these are %new
          ::  an instruction to a remote trove
        %-  to-show:(to-send p.f q.f)
        :-  %trove-fact
        !>([p.f [%new 0v0 trail.q.f node.q.f]])
      ::  an instruction to our trove
      =+  uvt=`@uvTROVE`(sham trail.q.f node.q.f)
      =.  troves
        %+  ~(put by troves)  sap
        :+  tam  rag
        %+  ~(put of `trove`tov)  trail.q.f
        (~(put by ?~(hav *tract u.hav)) [uvt node.q.f])
      %-  ~(rep in read.folder.perms)
      |=  [r=role o=_to]
      %-  to-cher
      :_  trove-fact+!>([p.f [%new uvt trail.q.f node.q.f]])
      ?:(?=(%member r) `*path ``path`/[r])
    ::
      %rem-node   to
      %edit-node  to
      %move-node  to
    ::
        %add-folder
      =+  hav=(~(get of `trove`tov) trail.q.f)
      =.  trail.q.f  (snoc trail.q.f nam.q.f)
      =+  perms=(to-perm trail.q.f)
      ?>  ?|  =(our.bol src.bol)
              =(p.sap src.bol)
          ::
            %-  ~(rep in ewe)
            |=  [r=role o=_|]
            ?:((~(has in add.folder.perms) r) & o)
          ==
      ?.  =(our.bol p.sap)
        ?:  =(our.bol src.bol)
          ::  an instruction to a remote trove
          %-  to-show:(to-send p.f q.f)
          trove-fact+!>(`fact`[p.f q.f])
        ::  an instruction about their trove
        ?>  =(p.sap src.bol)
        %.  trove-fact+!>(`fact`[p.f q.f])
        %=    to-show
            troves
          %+  ~(put by troves)  sap
          :+  tam
            ?~(p=pur.q.f rag (~(put by rag) trail.q.f u.p))
          (~(put of `trove`tov) trail.q.f *tract)
        ==
      :: an instruction to our trove
      ?>  =(~ hav)
      ?>  ?~(p=pur.q.f %.y (compare perms u.p))
      =.  troves
        %+  ~(put by troves)  sap
        :+  tam
          ?~(p=pur.q.f rag (~(put by rag) trail.q.f u.p))
        (~(put of `trove`tov) trail.q.f *tract)
      %-  %~  rep  in
          ?~(p=pur.q.f read.folder.perms read.folder.u.p)
      |=  [r=role o=_to]
      %-  to-cher
      :_  trove-fact+!>(f)
      ?:(?=(%member r) `*path ``path`/[r])
    ::
      %rem-folder         to
      %move-folder        to
      %permission-folder  to
    ==
  ::  +to-peer: handle on-watch for trove data
  ::
  ++  to-peer
    |=  rest=(pole knot)
    ^+  to
    =/  wat=?(%member %admin %moderator)
      ?+  rest  ~|(bad-trove-watch/rest !!)
        ~               %member
        [%admin ~]      %admin
        [%moderator ~]  %moderator
      ==
    ?>  ?|  ?.(=(%admin wat) | (~(has in admins.tam) src.bol))
            ?.(=(%member wat) | (~(has in members.tam) src.bol))
            ?.(=(%moderator wat) | (~(has in moderators.tam) src.bol))
        ==
    |^  stat
    ::
    ++  stat
      ^+  to
      (to-cher ~ trove-fact+!>([(need sup) %start tove]))
    ::
    ++  tove
      ^-  [regs trove]
      =/  leto=(list [trail tract])  ~(tap of `trove`tov)
      =|  truv=trove
      |-
      ?~  leto
        :_  truv
        %-  malt  %+  murn  ~(tap by rag)
        |=  [t=trail p=perm]
        ?.((~(has in read.folder.p) wat) ~ `[t p])
      ::
      =+  perms=~(has in read.folder:(to-perm -.i.leto))
      %=    $
        leto  t.leto
      ::
          truv
        ?.  (perms wat)  truv
        (~(put of `trove`truv) i.leto)
      ==
    --
  --

::  +sa: space engine
::
++  sa
  |_  $:  sup=(unit spat)
          mem=members:m
          caz=(list card)
      ==
  +*  sa   .
      dok  [our.bol %spaces]
      adm  (silt `(list role)`[%admin]~)
      mam  (silt `(list role)`~[%admin %moderator %member])
  ++  sa-emit  |=(c=card sa(caz [c caz]))
  ++  sa-emil  |=(lc=(list card) sa(caz (welp lc caz)))
  ++  sa-abet  ^-((quip card _state) [(flop caz) state])
  ::  +sa-show: send web-ui fact
  ++  sa-show
    |=(cag=cage (sa-emit %give %fact [/web-ui]~ cag))
  ::  +sa-view: watch spaces on /updates
  ::
  ++  sa-view
    ^+  sa
    %-  sa-emit
    [%pass /spaces/updates %agent dok %watch /updates]
  ::  +sa-init: handle initial load from spaces
  ::
  ++  sa-init
    |=  [spa=spaces:s mep=membership:m *]
    ^+  sa
    =+  sal=~(tap by spa)
    |-  ?~  sal  sa
    %=    $
      sal  t.sal
    ::
        sa
      sa-make(sup `-.i.sal, mem (~(got by mep) -.i.sal))
    ==
  ::  +sa-kill: delete a trove, the space was removed
  ::
  ++  sa-kill
    ^+  sa
    =+  sap=(need sup)
    =+  wir=`path`/(scot %p p.sap)/[q.sap]
    =/  wires=[path path path]
      =+  head=?:(=(our.bol p.sap) %trove %from)
      :+  head^wir
        head^(snoc wir %admin)
      head^(snoc wir %moderator)
    ?:  =(our.bol p.sap)
      =.  troves  (~(del by troves) sap)
      %-  sa-emit:(sa-show spaces-reaction+!>([%remove sap]))
      [%give %kick [-.wires +<.wires +>.wires ~] ~]
    =*  cad
      |=(p=path [%pass p %agent [p.sap %trove] %leave ~])
    =.  troves  (~(del by troves) sap)
    %-  sa-emil:(sa-show spaces-reaction+!>([%remove sap]))
    [(cad -.wires) (cad +<.wires) (cad +>.wires) ~]
  ::  +sa-make: subscribe to remote spaces, create local
  ::
  ++  sa-make
    ^+  sa
    =+  sap=(need sup)
    ?:  &(=(our.bol p.sap) (~(has by troves) sap))  sa
    =;  tru=[team regs trove]
      ?:  =(our.bol p.sap)
        sa(troves (~(put by troves) sap tru))
      =+  der=[p.sap %trove]
      =*  pem  ~(has in roles:(~(got by mem) our.bol))
      =/  pat=path  /(scot %p p.sap)/[q.sap]
      =?    sa
          ?&  (pem %admin)
          ::
            ?!  %-  ~(has in wex.bol)
            :_  [%.y trove+(snoc pat %admin)]
            [from+(snoc pat %admin) p.sap dap.bol]
          ==
        %-  sa-emit
        :+  %pass  from+(snoc pat %admin)
        [%agent der %watch trove+(snoc pat %admin)]
      ::
      ?.  ?&  |((pem %member) (pem %admin))
          ::
            ?!  %-  ~(has in wex.bol)
            [[from+pat p.sap dap.bol] [%.y trove+pat]]
          ==
        sa
      %-  sa-emit
      [%pass from+pat %agent der %watch trove+pat]
    ::
    :*
      ^-  team
      %-  ~(rep by mem)
      |=  [[s=ship m=member:m] t=team]
      ?:  &(=(our.bol p.sap) =(our.bol s))  t
      ?:  (~(has in roles.m) %admin)
        %=  t
          admins   (~(put in admins.t) s)
          members  (~(put in members.t) s)
        ==
      ?.  (~(has in roles.m) %member)  t
      t(members (~(put in members.t) s))
    ::
      ^-  regs
      ?.  =(our.bol p.sap)  *regs
      %-  ~(put by *regs)
      [/ [%0 [adm adm adm adm] [mam adm adm adm adm ~]]]
    ::
      *trove
    ==
  ::  +sa-dude: handle spaces-reaction marks
  ::
  ++  sa-dude
    |=  [mar=mark vaz=vase]
    ?+    mar  ~|(bad-dude-mark/mar !!)
        %spaces-reaction
      =/  act=reaction:s  !<(reaction:s vaz)
      ?+    -.act  sa
        %initial  (sa-init +.act)
        %remove   sa-kill(sup `+.act)
      ::
          %add
        sa-make(sup `path.space.act, mem members.act)
      ==
    ::
        %visa-reaction
      =/  act=reaction:v  !<(reaction:v vaz)
      ?+    -.act  sa
          %kicked
        ?:  =(our.bol ship.act)
          sa(troves (~(del by troves) path.act))
        =+  tov=(~(got by troves) path.act)
        %=    sa
            troves
          %+  ~(put by troves)  path.act
          %=  tov
              admins.team
            (~(del in admins.team.tov) ship.act)
          ::
              members.team
            (~(del in members.team.tov) ship.act)
          ::
              moderators.team
            (~(del in moderators.team.tov) ship.act)
          ==
        ==
      ::
          %invite-accepted
        =/  sap=(pair ship cord)  path.act
        =/  pat=path  /(scot %p p.sap)/[q.sap]
        =+  der=[p.sap %trove]
        =+  tov=(~(got by troves) path.act)
        =+  is-admin=(~(has in roles.member.act) %admin)
        =+  is-member=(~(has in roles.member.act) %member)
        =?    sa
            ?&  &(=(our.bol ship.act) is-admin)
            ::
              ?!  %-  ~(has in wex.bol)
              :_  [%.y trove+(snoc pat %admin)]
              [from+(snoc pat %admin) p.sap dap.bol]
            ==
          %-  sa-emit
          :+  %pass  from+(snoc pat %admin)
          [%agent der %watch trove+(snoc pat %admin)]
        =?    sa
            ?&  &(=(our.bol ship.act) |(is-member is-admin))
            ::
              ?!  %-  ~(has in wex.bol)
              [[from+pat p.sap dap.bol] [%.y trove+pat]]
            ==
          %-  sa-emit
          [%pass from+pat %agent der %watch trove+pat]
        %=    sa
            troves
          %+  ~(put by troves)  sap
          %=  tov
              admins.team
            ?.  is-admin  admins.team.tov
            (~(put in admins.team.tov) ship.act)
          ::
              members.team
            ?.  |(is-admin is-member)  members.team.tov
            (~(put in members.team.tov) ship.act)
          ==
        ==
      ==
    ==
  --
--