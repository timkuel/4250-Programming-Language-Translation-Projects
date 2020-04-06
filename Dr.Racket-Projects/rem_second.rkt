#lang racket
;Author: Timothy Kuelker
;Date:   October 10, 2019
;Course: CmpSCI 4250 - Programming Languages


;Function removes the second top-level
;element from the lsit
(define (rem_second a_list)
  ;If the passed in list is less than two elements,
  ;can not remove second element so return empty list
  (if (< (length a_list) 2)
      '()
      ;Else, construct a list from the first element of the list
      ;and the same list with the first two elements removed.
      (cons (car a_list) (cddr a_list))))


;These three will return a list without second elements
(rem_second '(1 2 3 4 5))
(rem_second '(1 (2 (2) 2) 3 4 5 6 (7 (8) 9) 10))
(rem_second '(1 2))

;This list is only one element, will get an empty list as output
(rem_second '(1))
