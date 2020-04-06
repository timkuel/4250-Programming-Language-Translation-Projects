#lang racket
;Author: Timothy Kuelker
;Date:   October 10, 2019
;Course: CmpSCI 4250 - Programming Languages


;Function returns a union of two simple lists.
;Puts all atoms of second list parameter into the first list
;parameter, if atom already exists in first list parameter, it
;will not add that atom.
(define (my_union simp_list_a simp_list_b)
  (cond
    ;If simp_list_b is empty, no more to add to simp_list_a,
    ;so return simp_list_a
    ((null? simp_list_b) simp_list_a)

    ;Is the first element of simp_list_b a member of simp_list_a
    ((member (car simp_list_b) simp_list_a)
     ;If yes, call my_union removing that element form simp_list_b
     (my_union simp_list_a (cdr simp_list_b)))

    ;Else, call my_union but with simp_list_a having the first element of
    ;simp_list_b be constructed into it, and the rest of simp_list_b
    (else (my_union (cons (car simp_list_b) simp_list_a) (cdr simp_list_b)))))


(my_union '(1 2 3 4 6) '(1 2 3 4 5))
(my_union '(1 5 7 9) '(2 4 7 6 8))
