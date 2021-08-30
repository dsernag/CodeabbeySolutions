; hyc dsernag.hy
; Compiling dsernag.hy

; Create a function to make the comparision
(defn pythagoreanCheck [array]
  ;Obtain the elements from array
  (setv a_side (int (get array 0)))
  (setv b_side (int (get array 1)))
  (setv c_side(int (get array 2)))

  ; Checksums
  (setv ab_sum_square (+ (* a_side a_side) (* b_side b_side)))
  (setv c_square (* c_side c_side))

  ; Check the condition
  (cond 
    [(= ab_sum_square c_square) (print :end "R ")]
    [(> ab_sum_square c_square) (print :end "A ")]
    [True (print :end "O ")]))

; Read the line and obtain the info
(defn readLines [lines counter]
  (if (>= counter lines)
    None
  (do
    (setv line (.split (input)))
    (pythagoreanCheck line)
    (readLines lines (+ counter 1)))))

; Run the reader
(readLines (int (input)) 0)
(print "")

; cat DATA.lst | hy dsernag.hy
; A A R O A O R R A O R A O A O O O O O A A A O R A O R R
