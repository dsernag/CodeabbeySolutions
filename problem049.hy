; hyc dsernag.hy
; Compiling dsernag.hy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PACKAGES;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require [hy.contrib.loop [loop]])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CHECK WINNER;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Return the winner of a partial match
(defn checkWinner[littleMatch]
  (cond 
    [(or (= littleMatch "PR") (= littleMatch "RS") (= littleMatch "SP"))
      "1"]
    [(or (= littleMatch "RP") (= littleMatch "SR") (= littleMatch "PS"))
      "2"]
    [True "0"]))
;;;;;;;;;;;;;;;;;;;;;;;;;;LOOP TROUGH LINE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Check every match and return the sum of points for 1 and 2
(defn checkEveryMatch [entryLine size]
  (loop [[i 0][points1 0] [points2 0]]
    (if (>= i size)
      (return [points1 points2])
      (do
        (setv winner (checkWinner (get entryLine i)))
        (cond [(= winner "1") (recur (inc i) (inc points1) points2)]
          [(= winner "2") (recur (inc i) points1 (inc points2))]
          [(= winner "0") (recur (inc i) points1 points2)])))))
;;;;;;;;;;;;;;;;;;;;;;;;;;RETURN ABSOLUT WINNER;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Return the winner of all matches
(defn returnWinner [values]
  (if (> (get values 0) (get values 1))
    (print :end " " "1")
    (print :end " " "2")))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Main;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Read first line and obtain each line, which represents one complete match
(defn main[]
  (setv size (int(input)))
  (loop[[i 0]]
    (if (>= i size)
      None
      (do
        (setv line (.split (input)))
        (setv sizeLine (len line))
        (returnWinner (checkEveryMatch line sizeLine))
        (recur (inc i))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(main)
(print "")
;
; cat DATA.lst | hy dserang.hy
; 1 2 1 2 1 1 2 2 1 1 1 1 1 1 1 2 2 2 1 2 1 2 1 2 1 2 1 2 