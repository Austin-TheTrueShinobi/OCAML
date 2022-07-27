/*
SDE1 Spring 2022 Prolog
Austin Briley
ECE 3520

Flower bed rules:
1) Beds are in a straight line, so each bed has two adjacent beds.  Beds 
are
numbered 1 .. N, N is at least 4 and should be even. Bed i is adjacent to
beds i-1 and i+1 (except beds 1 and N, of course).
2) Only one bed can have a given type of flower - available flowers are 
listed
in the flower predicate.
3) Flowers have Name, Size, Wet/Dry, Color.
4) No two adjacent beds can have the same color flower.
5) No two adjacent beds can have flowers whose size is more than one size
difference.  Sizes are small, med and tall so small next to small is fine,
small next to medium is fine, but small next to tall is not.
6) the two outermost beds (1 and N) are dry, the two innermost are wet, 
the
ones in between (if there are any) can take either.  For example, if there
were 8 beds the layout would be D E E W W E E D where D is dry, E is 
either,
and W is wet.
*/

% Flower types
flower(daisies, med, wet, yellow).
flower(roses, med, dry, red).
flower(petunias, med, wet, pink).
flower(daffodils, med, wet, yellow).
flower(begonias, tall, wet, white).
flower(snapdragons, tall, dry, red).
flower(marigolds, short, wet, yellow).
flower(gardenias, med, wet, red).
flower(gladiolas, tall, wet, red).
flower(bird_of_paradise, tall, wet, white).
flower(lilies, short, dry, white).
flower(azalea, med, dry, pink).
flower(buttercup, short, dry, yellow).
flower(poppy, med, dry, red).
flower(crocus, med, dry, orange).
flower(carnation, med, wet, white).
flower(tulip, short, wet, red).
flower(orchid, short, wet, white).
flower(chrysanthemum, tall, dry, pink).
flower(dahlia, med, wet, purple).
flower(geranium, short, dry, red).
flower(lavender, short, dry, purple).
flower(iris, tall, dry, purple).
flower(peonies, short, dry, pink).
flower(periwinkle, med, wet, purple).
flower(sunflower, tall, dry, yellow).
flower(violet, short, dry, purple).
flower(zinnia, short, wet, yellow).

/* 
1) implement the predicate to simply assign different flowers to the beds.
*/

%predicate:rules
%bedplan - Body/Goal
bedplan(F1,F2,F3,F4) :-
    %assigns the first set of beds
    flower(F1, S1, W1, C1),
    flower(F2, S2, W2, C2),
    flower(F3, S3, W3, C3),
    flower(F4, S4, W4, C4),
    %prints the set of beds
    write("Flower: name, size, wet/dry, color: "),write(F1),write(" "),write(S1),write(" "),write(W1),write(" "),write(C1),nl,
    write("Flower: name, size, wet/dry, color: "),write(F2),write(" "),write(S2),write(" "),write(W2),write(" "),write(C2),nl,
    write("Flower: name, size, wet/dry, color: "),write(F3),write(" "),write(S3),write(" "),write(W3),write(" "),write(C3),nl,
    write("Flower: name, size, wet/dry, color: "),write(F4),write(" "),write(S4),write(" "),write(W4),write(" "),write(C4),nl.
