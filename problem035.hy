; hyc dsernag.hy
; Compiling dsernag.hy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PACKAGES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require [hy.contrib.loop [loop]])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ROUND DECIMALS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn round [number]
    (setv numberInt (int number))
    (setv diff (- number numberInt))
    (return
      (+ numberInt
        (/ (- (* diff 100) (- (* diff 100) (int (* diff 100)))) 100))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CONUNT YEARS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Calculates how many years take the initial money to reach goal by increasing
; the initial + (0.08 * initial)
(defn calculateYears [entry]
  (setv initial (int (get entry 0)))
  (setv goal (int (get entry 1)))
  (setv interest (/ (int (get entry 2)) 100))

  (loop[[years 0][accum initial]]
    (if (>= accum goal)
      (print :end " " years)
      (recur (inc years) (round (+ accum (* accum interest)))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Main;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Read first line and obtain each line, which represents one complete match
(defn main[]
  (setv size (int(input)))
  (loop[[i 0]]
    (if (>= i size)
      None
      (do
        (setv line (.split (input)))
        (calculateYears line)
        (recur (inc i))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(main)
(print "")
;
; cat DATA.lst | hy dserang.hy
; 56 92 152 13 109 152 8 4 221 273 42 45 92 273 51
