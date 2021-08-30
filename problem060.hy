; hyc dsernag.hy
; Compiling dsernag.hy

; Specially thanks to djs1193 github user
; https://raw.githubusercontent.com/djs1193/codeabbey/master/q96.py
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PACKAGES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require [hy.contrib.loop [loop]])
(require [hy.contrib.slicing [ncut]])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAP INTEGER;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: List of Strings
; Return: List of Integers (If is possible)
; More efficient to work with the list of integers that strings
(defn mapInteger [list]
  (setv listIntegers [])
  (loop [[i 0]]
    (if (>= i (len list))
      listIntegers
      (do
        (.append listIntegers (int (get list i)))
        (recur (inc i))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;RECURSIVE SWEET HARVEST;;;;;;;;;;;;;;;;;;;;;;;;;;
; Input: The actual path and actual size
; Return: the maximum value of the cumulative recursion
; The most complicate issue is that you are asking a max value between to
; recursions. After that the problem solves easily
(defn sweetHarvest [path pos]
  (cond
    [(< pos 0) 0]
    [(= pos 0) (get path pos)]
    [True (+ (get path pos)
      (max (sweetHarvest path (- pos 2)) (sweetHarvest path (- pos 3))))]))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAIN FUNCTION;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Helper function to reverse the list:
(defn listReverser [list]
  (ncut list (slice -1 (dec (* (len list) -1)) -1)))
; Pop firs element:
(defn pop [list]
  (ncut list (slice 1 (- (len list) 1) 1)))
; Loop through each list of isles
(defn main[]
  (setv size (int(input)))
  (loop[[i 0]]
    (if (>= i size)
      None
      (do
        ; Obtaitn the initial isles
        (setv initialIsles (mapInteger (.split (input))))
        (setv pos (- (len initialIsles) 1))

        (setv path (listReverser initialIsles))
        (setv path1 (sweetHarvest path pos))

        (setv pathPop (pop path))
        (setv path2 (sweetHarvest pathPop (- pos 2)))

        (print :end " "(max path1 path2))
        (recur (inc i))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(main)
(print "")
;
; cat DATA.lst | hy dsernag.hy
; 143 226 178 171 172 233 162 185 198 162 144 200 141 179 115 126 199 155 189
; 141 126 155
