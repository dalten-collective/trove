/-  t=trove, s-p=spaces-path
|%
++  enjs
  =,  enjs:format
  |%
  ++  trail  ^spat
  ++  ships  |=(p=@p `json`((lead %s) (scot %p p)))
  ::
  ++  roles
    |=(a=(set role:t) `json`a/(turn ~(tap in a) (lead %s)))
  ::
  ++  spat
    |=(s=path:s-p `@t`(rap 3 (scot %p -.s) '/' +.s ~))
  ::
  ++  node
    |=  n=node:t
    ^-  json
    (pairs ~[type+s/-.n url+s/url.n dat+(data dat.n)])
  ::
  ++  tract
    |=  tat=tract:t
    ^-  json
    =-  o/(malt -)
    %+  turn  ~(tap by tat)
    |=  [k=@uv v=node:t]
    [(scot %uv k) `json`(node v)]
  ::
  ++  trove
    |=  axe=(axal tract:t)
    ^-  json
    =-  o/(malt -)
    ^-  (list [@t json])
    %+  turn  ~(tap by ~(tar of axe))
    |=  [k=trail:t v=tract:t]
    [(trail k) (tract v)]
  ::
  ++  regs
    |=  mp=(map ^path perm:t)
    ^-  json
    =-  o/(malt -)
    ^-  (list [@t json])
    %+  turn  ~(tap by mp)
    |=  [k=^path v=perm:t]
    [(trail k) (perm v)]
  ::
  ++  team
    |=  [p=(set @p) q=(set @p) r=(set @p)]
    ^-  json
    %-  pairs
    :~  admins+a/(turn ~(tap in p) ships)
        moderators+a/(turn ~(tap in q) ships)
        members+a/(turn ~(tap in r) ships)
    ==
  ::
  ++  state
    |=  $:  %0 
            t=(map spat.t [team.t regs.t trove.t])
        ==
    ^-  json
    %-  pairs
    :~  version+s/'0'
        troves+(troves t)
    ==
  ::
  ++  data
    |=  dat=data:meta:t
    ^-  json
    %-  pairs
    :~  from+(sect from.dat)
        by+(ships by.dat)
        title+s/title.dat
        description+s/description.dat
        extension+s/extension.dat
    ==
  ::
  ++  troves
    |=  tov=(map spat:t [team:t regs:t trove:t])
    ^-  json
    =-  o/(malt -)
    %+  turn  ~(tap by tov)
    |=  [k=spat:t v=[t=team:t r=regs:t tr=trove:t]]
    :-  (spat k)
    %-  pairs
    :~  team+(team t.v)
        regs+(regs r.v)
        trove+(trove tr.v)
    ==
  ::
  ++  perm
    |=  p=perm:t
    ^-  json
    %-  pairs
    :~
      :-  %files
      %-  pairs
      :~  add+(roles add.files.p)
          edit+(roles edit.files.p)
          move+(roles move.files.p)
          delete+(roles delete.files.p)
      ==
    ::
      :-  %folders
      %-  pairs
      :~  read+(roles read.folder.p)
          add+(roles add.folder.p)
          edit+(roles edit.folder.p)
          move+(roles move.folder.p)
          delete+(roles delete.folder.p)
          ch-mod+(roles ch-mod.folder.p)
      ==
    ==
  ++  fact
    |=  f=fact:t
    ^-  json
    ?+    -.q.f  !!
        %start
      =-  (frond add+-)
      %-  pairs
      :~  space+s/(spat p.f)
          regs+(regs p.q.f)
          trove+(trove q.q.f)
      ==
    ::
        %add-moderators
      %-  pairs
      :~  space+s/(spat p.f)
          :-  %add
          %+  frond  %team
          %+  frond  %moderators
          a/(turn ~(tap in +.q.f) ships)
      ==
    ::
        %rem-moderators
      %-  pairs
      :~  space+s/(spat p.f)
          :-  %rem
          %+  frond  %team
          %+  frond  %moderators
          a/(turn ~(tap in +.q.f) ships)
      ==
    ::
        %add-node
      %-  pairs
      :~  space+s/(spat p.f)
      ::
        :-  %add
        %+  frond  %node
        %-  pairs
        :~  id+s/(scot %uv id.q.f)
            trail+s/(trail trail.q.f)
            node+(node node.q.f)
        ==
      ==
    ::
        %rem-node
      %-  pairs
      :~  space+s/(spat p.f)
      ::
        :-  %rem
        %+  frond  %node
        %-  pairs
        :~  id+s/(scot %uv id.q.f)
            trail+s/(trail trail.q.f)
        ==
      ==
    ::
        %edit-node
      %-  pairs
      :~  space+s/(spat p.f)
      ::
        :-  %upd
        %+  frond  %node
        %-  pairs
        :~  id+s/(scot %uv id.q.f)
            trail+s/(trail trail.q.f)
            title+?~(tut.q.f ~ s/u.tut.q.f)
            description+?~(dus.q.f ~ s/u.dus.q.f)
        ==
      ==
    ::
      %move-node  !!
    ::
        %add-folder
      %-  pairs
      :~  space+s/(spat p.f)
      ::
        :-  %add
        %+  frond  %folder
        %-  pairs
        :~  trail+s/(trail trail.q.f)
            perms+?~(pur.q.f ~ (perm u.pur.q.f))
        ==
      ==
    ::
        %rem-folder
      %-  pairs
      :~  space+s/(spat p.f)
      ::
        :-  %add
        %-  frond
        folder+(frond trail+s/(trail trail.q.f))
      ==
    ::
        %move-folder
      %-  pairs
      :~  space+s/(spat p.f)
      ::
        :-  %move
        %+  frond  %folder
        %-  pairs
        :~  from+(frond trail+s/(trail from.q.f))
            to+(frond trail+s/(trail to.q.f))
        ==
      ==
    ==
  --
--