?- father(joseph_joestar,R).
R = holy_kujo ;
R = shizuka_joestar ;
R = josuke_higashikata.

?- mother(R,holy_kujo).
R = suzi_q_joestar ;

?- spouse(erina_joestar,R).
R = jonathan_joestar.

?- husband(R,erina_joestar).
R = jonathan_joestar ;

?- wife(erina_joestar,R).
R = jonathan_joestar.

?- grandparent(george_joestar_2,R).
R = holy_kujo ;
R = shizuka_joestar ;
R = josuke_higashikata.

?- grandfather(R,holy_kujo).
R = george_joestar_2 ;

?- grandmother(R,holy_kujo).
R = elizabeth_joestar ;

?- sibling(jonathan_joestar,R).
R = dio ;

?- brother(rikiel,R).
R = giorno_giovanna ;
R = donatello_versus ;
R = ungalo ;

?- sister(shizuka_joestar,R).
R = holy_kujo ;

?- stepsibling(shizuka_joestar,R).
R = josuke_higashikata ;

?- stepsister(shizuka_joestar,R).
R = josuke_higashikata ;

?- stepbrother(josuke_higashikata,R).
R = holy_kujo ;
R = shizuka_joestar ;

?- cousin(george_joestar_2,R).
R = giorno_giovanna ;
R = donatello_versus ;
R = rikiel ;
R = ungalo ;

?- uncle(dio,R).
R = george_joestar_2 ;

?- aunt(shizuka_joestar,R).
R = jotaro_kujo ;

?- generation(3,jonathan_joestar,R).
R = [holy_kujo, shizuka_joestar, josuke_higashikata] ;
