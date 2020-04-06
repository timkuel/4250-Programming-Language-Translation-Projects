/*Who the males are*/
male(pete).
male(mark).
male(tom).
male(john).
male(frank).
male(matt).
male(henry).
male(todd).

/*Who the females are*/
female(anne).
female(lilly).
female(kate).
female(alice).
female(jenny).

/*Who the parents are*/
parent(pete, mark).
parent(pete, tom).
parent(pete, anne).
parent(mark, lilly).
parent(mark, john).
parent(mark, frank).
parent(tom, kate).
parent(anne, alice).
parent(anne, matt).
parent(alice, henry).
parent(matt, jenny).
parent(matt, todd).



/*Rule for Sibling*/
siblings(X,Y) :- parent(Z,X), parent(Z, Y), X \= Y.

/*Rule for Sister*/
sister(X,Y) :- female(X), siblings(X,Y).

/*Rule for Brother*/
brother(X,Y) :- male(X), siblings(X,Y).

/*Rule for Father*/
father(Z,X) :- male(Z), parent(Z,X).

/*Rule for Mother*/
mother(Z,X) :- female(Z), parent(Z,X).

/*Rule for Grandparent*/
grandparent(Z,X) :- parent(Z,Y), parent(Y,X).

/*Rule for Grandfather*/
grandfather(Z,X) :- male(Z), grandparent(Z,X).

/*Rule for Grandmother*/
grandmother(Z,X) :- female(Z), grandparent(Z,X).



/* These are the queries ran. Results will
 * be stored in the same file as this source
 * file.
 
 a.) parent(pete, mark).
 b.) parent(anne, jenny).
 c.) father(Todds_Father, todd).
 d.) siblings(Toms_Siblings, tom).
 e.) brother(Lillys_Brother, lilly).
 f.) grandparent(Henrys_Grandparent, henry).
 g.) sister(Alices_Sister, alice).
 h.) brother(frank, kate).
 i.) mother(Matts_Mother, matt).
 j.) brother(Annes_Brother, anne).
 
 */
