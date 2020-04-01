#12100
Avenger Loader (River Styx)~
2 g 100
~
if %actor.is_pc%
  if !%actor.master%
    %load% mob 12100
  end
end
~
#12101
Avenger Autoattack~
0 g 100
~
set target %random.char%
if %target.is_pc%
  %send% %target% 	RThe River Styx unleashes it's wrath upon you!	n
  %echoaround% %target% 	WThe River Styx unleashes it's wrath upon %target.name%!	n
  mkill %target%
else
  %send% %actor% 	RThe River Styx unleashes it's wrath upon you!	n
  %echoaround% %actor% 	WThe River Styx unleashes it's wrath upon %target.name%!	n
  mkill %actor%
end
~
#12194
Heal Stealer~
2 p 100
~
if %spellname% == heal
  %echo% %spellname% %victim.name%
end
~
#12195
Quarter Heal Mob~
0 b 100
~
eval regen %self.maxhitp%/4
%echo% 	WThe Goddess Styx creates a wave of hatred that washes over %self.name%, healing %self.hisher% wounds!	n
%damage% %self% -%regen%
~
#12196
Hurl Actor (Mob Target) Into Door/Out Room~
0 k 100
~
*Written by Ether
*This trigger will randomly pick a valid direction and gather door bits and vnums of adjacent rooms.
*It then if checks the exits to make sure there are no closed doors.
*If there is a closed door in the direction chosen it will "hurl" the actor (person mob is fighting) head first into the door, damaging them, and making them sit.
*If there is no closed doors in the direction chosen it will "hurl" the actor into the adjacent room, damaging them, and making them sit.
*This trigger can be used on sentinel or roaming mobs and the beauty of it is you can tailor it to any mob and it's the same, yet different!
eval direction %random.dir%
eval doorcheck %%self.room.%direction%(bits)%
eval rvnum %%self.room.%direction%(vnum)%
if %doorcheck% == NOBITS || %doorcheck% == DOOR || %doorcheck% == DOOR PICKPROOF || %doorcheck% == DOOR UNDEFINED || %doorcheck% == DOOR PICKPROOF UNDEFINED
  %send% %actor% 	+An Avenger of Hatred grabs you by the neck and hurls you out of the area!	n
  %send% %actor% 	+An Avenger of Hatred's hurl 	RDEMOLISHES	n	+ you!	n
  %echoaround% %actor% 	+An Avenger of Hatred grabs %actor.name% by the neck and hurls %actor.himher% out of the area!	n
  %echoaround% %actor% 	+An Avenger of Hatred's hurl 	RDEMOLISHES	n	+ %actor.name%!	n
  %teleport% %actor% %rvnum%
  %force% %actor% look
  %send% %actor% You tumble a few times before landing on your ass!
  %damage% %actor% 100
  %actor.pos(sit)%
  %echoaround% %actor% %actor.name% comes tumbling into the area before landing on %actor.hisher% ass!
elseif
  %send% %actor% 	+An Avenger of Hatred grabs you by the neck and hurls you head first into the door to the %direction%!	n
  %send% %actor% 	+An Avenger of Hatred's hurl 	RDEMOLISHES	n	+ you!	n
  %actor.pos(sit)%
  %echoaround% %actor% 	+An Avenger of Hatred grabs %actor.name% by the neck and hurls %actor.himher% head first into the door to the %direction%!	n
  %echoaround% %actor% 	+An Avenger of Hatred's hurl 	RDEMOLISHES	n	+ %actor.name%!	n
  %damage% %actor% 100
end
~
#12197
Mob Reflect Spells~
0 p 100
~
eval reflect %random.10%
eval spelltype %spellname%
if %reflect% <= 1
  %send% %actor% 	WA shield of water surrounds %self.name% and reflects your spell back at you!	n
  %send% %actor% 	RAn Avenger of Hatred's %spelltype% 	Y<>	n	R<>	n	G<>	n	RBLOWS you to BITS!!!	n	G<>	n	R<>	n	Y<>	n
  %echoaround% %actor% 	WA shield of water surrounds %self.name% and reflects %actor.name%'s spell back at %actor.himher%!	n
  %echoaround% %actor% 	RAn Avenger of Hatred's %spelltype% 	Y<>	n	R<>	n	G<>	n	RBLOWS %actor.name% to BITS!!!	n	G<>	n	R<>	n	Y<>	n
  eval dam %actor.maxhitp%/5
  %damage% %actor% %dam%
  return 0
elseif %reflect% >=2
  set target %random.char%
  if %target.is_pc%
    %send% %target% 	WA shield of water surrounds %self.name% and reflects %actor.name%'s spell!	n
    %send% %target% 	RAn Avenger of Hatred's %spelltype% 	Y<>	n	R<>	n	G<>	n	RBLOWS you to BITS!!!	n	G<>	n	R<>	n	Y<>	n
    %echoaround% %target% 	WA shield of water surrounds %self.name% and reflects %actor.name%'s spell away!	n 
    %echoaround% %target% 	RAn Avenger of Hatred's %spelltype% 	Y<>	n	R<>	n	G<>	n	RBLOWS %target.name% to BITS!!!	n	G<>	n	R<>	n	Y<>	n
    eval dam %target.maxhitp%/5
    %damage% %target% %dam%
    return 0
  elseif !%target.is_pc%
    %send% %actor% 	WA shield of water surrounds %self.name% and reflects your spell back at you!	n
    %send% %actor% 	RAn Avenger of Hatred's %spelltype% 	Y<>	n	R<>	n	G<>	n	RBLOWS you to BITS!!!	n	G<>	n	R<>	n	Y<>	n
    %echoaround% %actor% 	WA shield of water surrounds %self.name% and reflects %actor.name%'s spell back at %actor.himher%!	n
    %echoaround% %actor% 	RAn Avenger of Hatred's %spelltype% 	Y<>	n	R<>	n	G<>	n	RBLOWS %actor.name% to BITS!!!	n	G<>	n	R<>	n	Y<>	n
    eval dam %actor.maxhitp%/5
    %damage% %actor% %dam%
    return 0
  end
end
~
#12198
Room Damage PC~
2 b 100
~
set target %random.char%
if %target.room(12103)% && %target.is_pc%
  %send% %target% 	RHatred flows from the river and torments your soul!	n
  %echoaround% %target% 	WHatred flows from the river and torments %target.name%'s soul!	n
  %damage% %target% 350
end
~
#12199
Dispel Sanctuary~
0 k 75
~
This trigger will target the person the mob is fighting first and attempt to dispel sanctuary.
*If that person is not affected by sanctuary it will target a random character in room to dispel sanctuary.
if %actor.affect(sanct)%
  dg_cast 'betrayal' %actor%
  %send% %actor% 	WAn Avenger of Hatred lowers %self.hisher% body into the water, harnessing the hate.	n
  %send% %actor% 	WAn Avenger of Hatred's body begins violently convulsing as rays of 	n	Rred light	n	W shoot from %self.hisher% eyes, weakening your defenses!	n
  %echoaround% %actor% 	WAn Avenger of Hatred lowers %self.hisher% body into the water, harnessing the hate.	n
  %echoaround% %actor% 	WAn Avenger of Hatred's body begins violently convulsing as rays of 	n	Rred light	n	W shoot from %self.hisher% eyes, weakening %actor.name%'s defenses!	n
else
  set target %random.char%
  if %target.is_pc% && %target.affect(sanct)%
    dg_cast 'betrayal' %target%
    %send% %target% 	W%An Avenger of Hatred lowers %self.hisher% body into the water, harnessing the hate.	n
    %send% %target% 	WAn Avenger of Hatred's body begins violently convulsing as rays of 	n	Rred light	n	W shoot from %self.hisher% eyes, weakening your defenses!	n
    %echoaround% %target% 	WAn Avenger of Hatred lowers %self.hisher% body into the water, harnessing the hate.	n
    %echoaround% %target% 	WAn Avenger of Hatred's body begins violently convulsing as rays of 	n	Rred light	n	W shoot from %self.hisher% eyes, weakening %target.name%'s defenses!	n
  end
end
~
#12200
Charon Ferry over Styx~
0 g 100
~
%echo% This trigger commandlist is not complete!
~
$~
