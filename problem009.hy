; hyc dsernag.hy
; Compiling dsernag.hy

; Create a function to make the comparision
(defn triangleCheck [array]
  ;Obtain the elements from array
  (setv a_side (int (get array 0)))
  (setv b_side (int (get array 1)))
  (setv c_side(int (get array 2)))

  ; Checksums
  (setv a_b_sum (+ a_side b_side))
  (setv a_c_sum (+ a_side c_side))
  (setv b_c_sum (+ b_side c_side))

  ; Check the condition
  (cond [(<= a_b_sum c_side)
          (print "0")]
        [(<= a_c_sum b_side)
          (print "0")]
        [(<= b_c_sum a_side)
          (print "0")]
        [True
          (print "1")]))

; Read the line and obtain the info
(defn readLines [lines counter]
  (if (>= counter lines)
    None
  (do
    (setv line (.split (input)))
    (triangleCheck line)
    (readLines lines (+ counter 1)))))

; Run the reader
(readLines (int (input)) 0)

; cat DATA.lst | hy dsernag.hy
; 1 0 1 0 0 0 0 1 0 1 1 1 1 0 0 1 1 1 0 1 0
