; hyc dsernag.hy
; Compiling dsernag.hy

;Define a function to find the amount of months
(defn mortgageCalculator [inputLine]
  ;Obtain elements from array
  (setv loan (float (get inputLine 0)))
  (setv interest (/ (float (get inputLine 1)) 100))
  (setv months (float (get inputLine 2)))

  (setv plus_interest (+ 1 (/ interest 12)))

  (setv pay
  (/ (* loan (pow plus_interest months) (- plus_interest 1))
  (- (pow plus_interest months) 1)))

  (print (round pay)))

; Define a function to read the line
(defn readLine []
  (setv entry_lines (.split (input)))

  (mortgageCalculator entry_lines))

(readLine)

; cat DATA.lst | hy dsernag.hy
; 45885
