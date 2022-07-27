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

/* Final Flower bed layout */
/*
5) increase to 6 beds.
*/

%facts - only one size difference allowed
compatible_size(SA,SB) :- SA = small , SB = med.
compatible_size(SA,SB) :- SA = med , SB = small.
compatible_size(SA,SB) :- SA = small , SB = small.
compatible_size(SA,SB) :- SA = med , SB = med.
compatible_size(SA,SB) :- SA = tall , SB = tall.
compatible_size(SA,SB) :- SA = tall , SB = med.
compatible_size(SA,SB) :- SA = med , SB = tall.

%predicate:rules
%bedplan - Body/Goal
bedplan(F1,F2,F3,F4,F5,F6) :-
    %assigns the first set of beds to 6 flowers
    flower(F1, S1, W1, C1),
    flower(F2, S2, W2, C2),
    flower(F3, S3, W3, C3),
    flower(F4, S4, W4, C4),
    flower(F5, S5, W5, C5),
    flower(F6, S6, W6, C6),
    %checks to see if the set of beds have unique flowers
    F1 \== F2,
    F1 \== F3,
    F1 \== F4,
    F1 \== F5,
    F1 \== F6,
    F2 \== F1,
    F2 \== F3,
    F2 \== F4,
    F2 \== F5,
    F2 \== F6,
    F3 \== F1,
    F3 \== F2,
    F3 \== F4,
    F3 \== F5,
    F3 \== F6,
    F4 \== F1,
    F4 \== F2,
    F4 \== F3,
    F4 \== F5,
    F4 \== F6,
    F5 \== F1,
    F5 \== F2,
    F5 \== F3,
    F5 \== F4,
    F5 \== F6,
    F6 \== F1,
    F6 \== F2,
    F6 \== F3,
    F6 \== F4,
    F6 \== F5,
    %checks to see if the set of beds have unique adjacent colors
    C1 \== C2,
    C2 \== C3, 
    C3 \== C4,
    C4 \== C5,
    C5 \== C6,
    %checks to see if the set of beds are dry on the outermost beds and wet on the innermost
    W1 = dry,
    W6 = dry,
    W4 = wet,
    W3 = wet,
    %checks to see if the set of beds have size constraint of no more than one size difference
    compatible_size(S1,S2),
    compatible_size(S2,S3),
    compatible_size(S3,S4),
    compatible_size(S4,S5),
    compatible_size(S5,S6),
    %prints the final flower bed layout
    write("Flower: name, size, wet/dry, color: "),write(F1),write(" "),write(S1),write(" "),write(W1),write(" "),write(C1),nl,
    write("Flower: name, size, wet/dry, color: "),write(F2),write(" "),write(S2),write(" "),write(W2),write(" "),write(C2),nl,
    write("Flower: name, size, wet/dry, color: "),write(F3),write(" "),write(S3),write(" "),write(W3),write(" "),write(C3),nl,
    write("Flower: name, size, wet/dry, color: "),write(F4),write(" "),write(S4),write(" "),write(W4),write(" "),write(C4),nl,
    write("Flower: name, size, wet/dry, color: "),write(F5),write(" "),write(S5),write(" "),write(W5),write(" "),write(C5),nl,
    write("Flower: name, size, wet/dry, color: "),write(F6),write(" "),write(S6),write(" "),write(W6),write(" "),write(C6),nl.
