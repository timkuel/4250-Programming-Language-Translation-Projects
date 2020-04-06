#lang racket
;Author: Timothy Kuelker
;Date:   October 10, 2019
;Course: CmpSCI 4250 - Programming Languages


;Function deletes all occurences of an atom from a list
;regardless of depth.  Will not return an empty list item
;as a replacement to the removed item.
(define (my_delete atom a_list)
  (cond
   ;If a_list is null, no item to remove so return empty list
   ((null? a_list) '())
   
   ;Is the front element of a list, also a list,
   ((list? (car a_list))
    ;If yes, construct a list from a call to my_delete with the sublist
    ;and a call to my_delete with the rest of the list
    (cons (my_delete atom (car a_list)) (my_delete atom (cdr a_list))))

   ;Does the atom equal the front end of the list
   ;If yes call rest of list without first element
   ((equal? atom (car a_list)) (my_delete atom (cdr a_list)))

   ;Else, keep constructing a list from the first item of the list
   ;and a call to my_delete with the rest of the list
   (else (cons (car a_list) (my_delete atom (cdr a_list))))))



(my_delete '5 '(1 2 5 (3 5) (4 (5 6) 7 5) 8 9 5 10))
