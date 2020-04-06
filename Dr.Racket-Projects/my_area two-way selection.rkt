#lang racket
;Author: Timothy Kuelker
;Date:   October 10, 2019
;Course: CmpSCI 4250 - Programming Languages


;Defining an atom pi as 3.1416
(define pi 3.1416)

;Function that squares an atom
(define (square n)
  (* n n))

;Function that cubes an atom
(define (cube n)
  (* n n n))

;Function that calculates the area of a circle given a radius
(define (square_area radius)
  (* pi (square radius)))

;Function that calculates the volume of a circle given a radius
(define (square_volume radius)
  (* (/ 4 3) (* pi (cube radius))))


;Function either calculates the are or volume of a circle given a radius
;Atom n either needs to be 1 (for area) or 2 (for volume)
(define (my_area n radius)
  ;If n != 1 or n != 2 AND radius is NOT posotive return false
  (if (not (and (or (= n 1) (= n 2)) (positive? radius))) #f
      
          ;If n = 1, run area function
          (if (= n 1)
              (square_area radius)
              ;Else, run the volume function
              (square_volume radius))))


;These two will sucessfully calculate an area and volume
(my_area 1 10)
(my_area 2 10)

;These two will fail since the radius is negative in one,
;and neither 1 or 2 was given as the first parameter
(my_area 1 -5)
(my_area 3 5)
