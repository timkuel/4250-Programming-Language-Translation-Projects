/*Function that will take a list and a variable
 * as parameters, it will then remove the first 
 * element of the list and set it as the current 
 * max value (P) and then call the other list_max
 * function, with the rest of the list as the
 * first parameter, first max value as second,
 * and the variable name as third.*/

max_of_list([P|T], Max) :- max_of_list(T, P, Max).

/*List is empty, all elements have been compared,
 * start to return up the recursive calls, setting
 * the previously found max (P) as the variable (O)*/

max_of_list([], P, P).

/*Function that recursivley checks the head of a
 * list against the previous head, replacing
 * the max value (P) if necessary.*/

max_of_list([H|T], P, Max) :-
    
    /*Checking if the current head of the list (H) is greater
     * than the previous head of the list (P)*/
    
    (    H > P
    
    	/*If true, make H the new max of list*/
    ->   max_of_list(T, H, Max)
    
    	/*Else, keep P as the max of list*/
    ;    max_of_list(T, P, Max)).
