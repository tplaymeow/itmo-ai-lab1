% Male facts:
male(george_joestar_1).
male(jonathan_joestar).
male(dio).
male(george_joestar_2).
male(giorno_giovanna).
male(donatello_versus).
male(rikiel).
male(ungalo).
male(joseph_joestar).
male(sadao_kujo).
male(josuke_higashikata).
male(jotaro_kujo).

% Female facts:
female(mary_joestar).
female(erina_joestar).
female(unnamed_woman_dio).
female(elizabeth_joestar).
female(suzi_q_joestar).
female(tomoko_higashikata).
female(holy_kujo).
female(shizuka_joestar).
female(unnamed_woman_jotaro).
female(jolyne_cujoh).

% Spouse facts:
spoused(george_joestar_1,mary_joestar).
spoused(jonathan_joestar,erina_joestar).
spoused(dio,unnamed_woman_dio).
spoused(george_joestar_2,elizabeth_joestar).
spoused(joseph_joestar,suzi_q_joestar).
spoused(joseph_joestar,tomoko_higashikata).
spoused(sadao_kujo,holy_kujo).
spoused(jotaro_kujo,unnamed_woman_jotaro).

% Parent:
parent(george_joestar_1,jonathan_joestar).
parent(george_joestar_1,dio).
parent(mary_joestar,jonathan_joestar).
parent(mary_joestar,dio).
parent(jonathan_joestar,george_joestar_2).
parent(erina_joestar,george_joestar_2).
parent(dio,giorno_giovanna).
parent(dio,donatello_versus).
parent(dio,rikiel).
parent(dio,ungalo).
parent(unnamed_woman_dio,giorno_giovanna).
parent(unnamed_woman_dio,donatello_versus).
parent(unnamed_woman_dio,rikiel).
parent(unnamed_woman_dio,ungalo).
parent(george_joestar_2,joseph_joestar).
parent(elizabeth_joestar,joseph_joestar).
parent(joseph_joestar,holy_kujo).
parent(joseph_joestar,shizuka_joestar).
parent(joseph_joestar,josuke_higashikata).
parent(suzi_q_joestar,holy_kujo).
parent(suzi_q_joestar,shizuka_joestar).
parent(tomoko_higashikata,josuke_higashikata).
parent(sadao_kujo,jotaro_kujo).
parent(holy_kujo,jotaro_kujo).
parent(jotaro_kujo,jolyne_cujoh).
parent(unnamed_woman_jotaro,jolyne_cujoh).

% Husband rule
father(F,C) :-
    male(F), parent(F,C).

% Mother rule
mother(M,C) :-
    female(M), parent(M,C).

% Spouse rule
spouse(A,B) :- 
    spoused(A,B).
spouse(A,B) :-
    spoused(B,A).

% Husband rule
husband(A,B) :-
    male(A), spouse(A,B).

% Wife rule
wife(A,B) :-
    female(A), spouse(A,B).

% Grandparent rule
grandparent(G,C) :-
    parent(G,P), parent(P,C).

% Grandfather rule
grandfather(G,C) :-
    male(G), grandparent(G,C).

% Grandmother rule
grandmother(G,C) :-
    female(G), grandparent(G,C).

% Sibling rule
sibling(X,Y) :-
    father(F,X), mother(M,X),
    father(F,Y), mother(M,Y),
    X\=Y.

% Brother rule
brother(X,Y) :-
    male(X), sibling(X,Y).

% Sibling rule
sister(X,Y) :- 
    female(X), sibling(X,Y).

% Sibling rule
stepsibling(X,Y) :-
    father(F1,X), mother(M,X),
    father(F2,Y), mother(M,Y),
    F1\=F2, X\=Y.
stepsibling(X,Y) :-
    father(F,X), mother(M1,X),
    father(F,Y), mother(M2,Y),
    M1\=M2, X\=Y.

% Step brother rule
stepbrother(X,Y) :-
    male(X), stepsibling(X,Y).

% Sibling rule
stepsister(X,Y) :- 
    female(X), stepsibling(X,Y).

% Cousin rule
cousin(X,Y) :-
    parent(XP, X), parent(YP, Y), sibling(XP,YP).

% Uncle rule
uncle(U,C) :-
    male(U), parent(P,C), sibling(U,P).

% Aunt rule
aunt(A,C) :-
    female(A), parent(P,C), sibling(A,P).

% Generation rule
generation(0,Root,[Root]).
generation(Number,Root,Generation) :-
    Number>0, NextNumber is Number-1,
    findall(Child,parent(Root,Child),Childs),
    maplist(generation(NextNumber),Childs,Generations),
    append(Generations,Generation).

