/* FACTS */
/* Instances of the parent relationship */
parent(tom, bob).       % Tom is parent of Bob.
parent(pam, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
/* Gender */
female(pam).            % Pam is female.
female(liz).
female(pat).
female(ann).
male(tom).              % Tom is male.
male(bob).
male(jim).

/* RULES */
offspring(Y, X) :-      % Y is an offspring of X.
    parent(X, Y).

mother(X, Y) :-
    parent(X, Y),
    female(X).
father(X, Y) :-
    parent(X, Y),
    male(X).

daughter(X, Y) :-
    offspring(X, Y),
    female(X).
son(X, Y) :-
    offspring(X, Y),
    male(X).

grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).
grandmother(X, Y) :-
    grandparent(X, Y),
    female(X).
grandfather(X, Y) :-
    grandparent(X, Y),
    male(X).

sister(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    female(X).
    /*different(X, Y).*/
brother(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    male(X).
    /*different(X, Y).*/

hasachild(X) :-
    parent(X, _).

happy(X) :-
    hasachild(X).

hastwochildren(X) :-
    parent(X, Y),
    sister(_, Y).

grandchild(Z, X) :-
    parent(X, Y),
    parent(Y, Z).

aunt(X, Y) :-
    sister(X, Z),
    parent(Z, Y).

/* Predecessor base case and recursive relation.
Predecessor is a procedure made up of two clauses
that describe the same relation.
*/
predecessor(X, Z) :-
    parent(X, Z).
predecessor(X, Z) :-
    parent(X, Y),
    predecessor(Y, Z).