/*FACTS*/

mushroomType(poisonous).
mushroomType(edible).

mushroom(edible,hasPresenceWorms).
mushroom(edible,hasPresenceScales).
mushroom(edible,pleasantOdor).
mushroom(edible,sweetTaste).
mushroom(edible,greenCapColor).
mushroom(edible,purpleCapColor).
mushroom(edible,sunkenCapShape).
mushroom(edible,redGillColor).
mushroom(edible,orangeGillColor).
mushroom(edible,brownVeilColor).
mushroom(edible,flaringRing).
mushroom(edible,blackSporeColor).
mushroom(edible,orangeSporeColor).
mushroom(edible,purpleSporeColor).
mushroom(edible,yellowSporeColor).

mushroom(poisonous,noPresenceWorms).
mushroom(poisonous,noPresenceScales).
mushroom(poisonous,groovesCapSurface).
mushroom(poisonous,badOdor).
mushroom(poisonous,bitterTaste).
mushroom(poisonous,sourTaste).
mushroom(poisonous,badTaste).
mushroom(poisonous,convexCapShape).
mushroom(poisonous,buffGillColor).
mushroom(poisonous,greenGillColor).
mushroom(poisonous,yellowVeilColor).
mushroom(poisonous,noRing).
mushroom(poisonous,greenSporeColor).

/*RULES*/
edible(X):-write('Edible mushroom properties?'),mushroom(edible,X).
poisonous(X):-write('Poisonous mushroom properties?'),mushroom(poisonous,X).

safe(X):-mushroom(edible,X).
notSafe(X):-mushroom(poisonous,X).

/*recursive*/
safe(X,Y):-mushroom(X,Y).
safe(X,Y):-(mushroom(edible,X),safe(edible,Y)).

notSafe(X,Y):-mushroom(X,Y).
notSafe(X,Y):-(mushroom(poisonous,X),notSafe(poisonous,Y)).

/*List*/
sporeColor_list(X,[X|_]).
sporeColor_list(X,[_|T]):- sporeColor_list(X,T).

listOfMushroomProperties([presenceWorms,presenceScales,odor,taste,
capColor,capShape,gillColor,veilColor,ring,sporeColor,capSurface]).
mushroomProperties(X):-listOfMushroomProperties(T),member(X,T).