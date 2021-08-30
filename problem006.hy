; hyc dsernag.hy
; Compiling dsernag.hy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PACKAGES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require [hy.contrib.loop [loop]])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ROUNDING FUNCTION;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Implement a rounding function
(defn divideAndRound [value]
  (setv dividend (int (get value 0)))
  (setv divisor (int (get value 1)))

  (setv quotientReal (/ dividend divisor))
  (setv quotientInt (int quotientReal))

  (if (>= (- quotientReal quotientInt) 0.5)
    (print :end " " (+ quotientInt 1))
    (print :end " " quotientInt)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Main;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Read first entry (number of elements) iterate over them, apply rounding func
(defn main[]
  (setv size (int(input)))
  (loop[[i 0]]
    (if (>= i size)
      None
      (do
        (setv linea (.split (input)))

        (divideAndRound linea)
        (recur (inc i))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(main)
(print "")
;
; cat DATA.lst | hy dserang.hy
; 16753 1 3 177603 153452 15 11 -4 17 11 6 11 6 21 1 13 13 2558 9 10 10 5242 20
; 11 8392 