/*Function that will take two lists as parameters. It will
 * then make a union from those two lists, making sure that
 * if an atom in List2 is a member of List1, it will not
 * append it to Union. After all atoms have been gone through
 * in List2, List1 will then be appended to Union. */


/*If List1 and List2 were both empty, return an empty set*/
union([],[],[]).

/*List2 is empty, stop recursive call and return up call
 * stack.*/
union(List1,[],List1).

/*Original function call, will keep calling itself if 
 * an atom of List2 is a member of List1.*/
union(List1, [Head2|Tail2], [Head2|Union]):-
    \+(member(Head2,List1)), union(List1,Tail2,Union).

/*Function called when an atom of List2 is not a member
 * of List1.*/
union(List1, [Head2|Tail2], Union):-
    member(Head2,List1), union(List1,Tail2,Union). 
